//
//  AccoountCreationViewModel.swift
//  Flow
//
//  Created by Vlad Novol on 31.01.2021.
//

import SwiftUI
import Firebase
import FirebaseStorage

class AccountCreationViewModel: ObservableObject{
    @Published var accountFirebase = [AccountFirebase]()
    
    @Published var name = ""
    @Published var bio = ""
    @Published var bonuses = 9000
    @Published var phNumber = ""
    
    @Published var pageNumber = 0
    
    @Published var accountImage = Array(repeating: Data(count: 0), count: 1)
    @Published var picker = false
    
    @Published var alert = false
    @Published var alertMsg = ""
    
    @Published var isLoading = false
    
    @Published var CODE = ""
    
    @AppStorage("current_bonuses") var userBonuses = 0
    @AppStorage("current_user") var userName = ""
    @AppStorage("current_phone") var userPhone = ""
    @AppStorage("current_bio") var userBio = ""
    @AppStorage("current_image") var userImage = ""
    
    private var db = Firestore.firestore()
    
    func saveImage(imageName: String, image: UIImage) {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        let fileName = imageName
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        guard let data = image.jpegData(compressionQuality: 1) else { return }
        
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path)
                print("Removed old image")
            } catch let removeError {
                print("couldn't remove file at path", removeError)
            }
        }
        do {
            try data.write(to: fileURL)
        } catch let error {
            print("error saving file with error", error)
        }
    }
    
    func login(){
        isLoading.toggle()
        
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        PhoneAuthProvider.provider().verifyPhoneNumber("+" + phNumber, uiDelegate: nil) { (CODE, err) in
            
            self.isLoading.toggle()
            
            if err != nil{
                self.alertMsg = err!.localizedDescription
                self.alert.toggle()
                return
            }
            
            self.CODE = CODE!
            
            let alertView = UIAlertController(title: "Verification", message: "Enter Code", preferredStyle: .alert)
            
            let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
            
            let ok = UIAlertAction(title: "Ok", style: .default) { (_) in
                
                if let otp = alertView.textFields![0].text{
                    
                    let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.CODE, verificationCode: otp)
                    
                    self.isLoading.toggle()
                    
                    Auth.auth().signIn(with: credential) { (res, err) in
                        if err != nil{
                            self.alertMsg = err!.localizedDescription
                            self.alert.toggle()
                            self.isLoading.toggle()
                            return
                        }
                        withAnimation{
                            self.pageNumber = 1
                        }
                        self.isLoading.toggle()
                    }
                }
            }
            alertView.addTextField { (txt) in
                txt.placeholder = "message code"
            }
            alertView.addAction(cancel)
            alertView.addAction(ok)
            
            UIApplication.shared.windows.first?.rootViewController?.present(alertView, animated: true, completion: nil)
        }
    }
    
    func signUp(){
        let storage = Storage.storage().reference()
        
        let ref = storage.child("profile_Pics").child(Auth.auth().currentUser!.uid)
        
        var urls : [String] = []
        
        isLoading.toggle()
        
        for index in accountImage.indices{
            func saveImage(imageName: String, image: UIImage) {
                guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
                
                let fileName = imageName
                let fileURL = documentsDirectory.appendingPathComponent(fileName)
                guard let data = image.jpegData(compressionQuality: 1) else { return }
                
                if FileManager.default.fileExists(atPath: fileURL.path) {
                    do {
                        try FileManager.default.removeItem(atPath: fileURL.path)
                        print("Removed old image")
                    } catch let removeError {
                        print("couldn't remove file at path", removeError)
                    }
                }
                do {
                    try data.write(to: fileURL)
                } catch let error {
                    print("error saving file with error", error)
                }
            }
            
            saveImage(imageName: "profileImage.jpg", image: UIImage(data: accountImage[index]) ?? UIImage(named: "120x120_clear")!)
            
            ref.child("img\(index)").putData(accountImage[index], metadata: nil) { (_, err) in
                if err != nil{
                    self.alertMsg = err!.localizedDescription
                    self.alert.toggle()
                    self.isLoading.toggle()
                    return
                }
                
                ref.child("img\(index)").downloadURL { (url, _) in
                    guard let imageUrl = url else{return}
                    
                    urls.append("\(imageUrl)")
                    
                    if urls.count == self.accountImage.count{
                        self.RegisterUser(urls: urls)
                    }
                }
            }
        }
    }
    
    func RegisterUser(urls: [String]){
        db.collection("Users").document(Auth.auth().currentUser!.uid).setData([
            
            "userName": self.name,
            "bio": self.bio,
            "imageUrls": urls[0],
            "bonuses": String(self.bonuses),
            "phone": self.phNumber
            
        ]) { (err) in
            self.isLoading.toggle()
            
            if err != nil{
                self.alertMsg = err!.localizedDescription
                self.alert.toggle()
                return
            }
            
            UserDefaults.standard.set(true, forKey: "status")
            UserDefaults.standard.set(self.name, forKey: "userName")
            UserDefaults.standard.set(self.bonuses, forKey: "userBonuses")
            UserDefaults.standard.set(self.phNumber, forKey: "userPhNumber")
            UserDefaults.standard.set(self.bio, forKey: "userBio")
            
            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
        }
    }
    func signOut() {
        do { try Auth.auth().signOut() }
        catch { print("already logged out") }
        
        UserDefaults.standard.set(false, forKey: "status")
        
        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
    }
    
    //        func fetchData() {
    //          db.collection("Users").addSnapshotListener { (querySnapshot, error) in
    //            guard let documents = querySnapshot?.documents else {
    //              print("No documents")
    //              return
    //            }
    //
    //            self.accountFirebase = documents.map { queryDocumentSnapshot -> AccountFirebase in
    //              let data = queryDocumentSnapshot.data()
    //              let name = data["userName"] as? String ?? ""
    //              let phone = data["phone"] as? String ?? ""
    //              let bio = data["bio"] as? String ?? ""
    //              let profileImage = data["imageUrls"] as? String ?? ""
    //              let bonuses = data["bonuses"] as? Int ?? 0
    //
    //                return AccountFirebase(uid: .init(), name: name, phone: phone, bio: bio, profileImage: profileImage, bonuses: bonuses)
    //            }
    //          }
    //        }
    //
    //    private var listenerRegistration: ListenerRegistration?
    
    //    func subscribe() {
    //      if listenerRegistration == nil {
    //        listenerRegistration = db.collection("Users").addSnapshotListener { (querySnapshot, error) in
    //          guard let documents = querySnapshot?.documents else {
    //            print("No documents")
    //            return
    //          }
    //
    //          self.accountFirebase = documents.compactMap { queryDocumentSnapshot in
    //            try? queryDocumentSnapshot.data(as: AccountFirebase.self)
    //          }
    //        }
    //      }
    //    }
    
    //    func getDocument() {
    //         //Get sspecific document from current user
    //         let docRef = Firestore.firestore().collection("users").whereField("uid", isEqualTo: Auth.auth().currentUser?.uid ?? "")
    //
    //         // Get data
    //         docRef.getDocuments { (querySnapshot, err) in
    //             if let err = err {
    //                 print(err.localizedDescription)
    //                 return
    //             } else if querySnapshot!.documents.count != 1 {
    //                 print("More than one document or none")
    //             } else {
    //                 let document = querySnapshot!.documents.first
    //                 let dataDescription = document?.data()
    //                 guard let firstname = dataDescription?["firstname"] else { return }
    //                 print(firstname)
    //             }
    //         }
    //     }
}
