////
////  ChatView.swift
////  Flow
////
////  Created by Vlad Novol on 2/21/21.
////
//
//import SwiftUI
//import Firebase
//import FirebaseFirestoreSwift
//
//struct ChatView: View {
//    @StateObject var homeData = HomeModel()
//    @AppStorage("current_user") var user = ""
//    @State var scrolled = false
//    
//    var body: some View {
//        VStack {
//            HStack{
//                Text("Support")
//                Spacer()
//            }
//            .padding()
//            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
//            ScrollViewReader{ reader in
//                ScrollView{
//                    VStack(spacing: 15) {
//                        ForEach(homeData.msgs) {msg in
//                            ChatRow(chatData: msg)
//                                .onAppear {
//                                    if msg.id == self.homeData.msgs.last!.id && !scrolled {
//                                        reader.scrollTo(homeData.msgs.last!.id, anchor: .bottom)
//                                        scrolled = true
//                                    }
//                                }
//                        }
//                        .onChange(of: homeData.msgs, perform:{value in
//                            reader.scrollTo(homeData.msgs.last!.id, anchor: .bottom)
//                        })
//                    }
//                    .padding(.vertical)
//                }
//            }
//            HStack(spacing: 15){
//
//            }
//        }
//    }
//}
//
//struct ChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatView()
//    }
//}
//
//struct ChatRow: View {
//    @AppStorage("current_user") var user = ""
//
//    var chatData: MsgModel
//
//    var body: some View{
//        HStack(spacing: 15){
//            if chatData.user != user {
//                NickName(name: chatData.user)
//            }
//
//            if chatData.user == user{Spacer()}
//
//            VStack(alignment: chatData.user == user ? .trailing : .leading, spacing: 5) {
//                Text(chatData.msg)
//                    .clipShape(ChatBubble(myMsg: chatData.user == user))
//
//                Text(String(chatData.timeStamp), style: .time)
//                    .padding(chatData.user != user ? .leading : .trailing , 10)
//            }
//
//            if chatData.user == user{
//                NickName(name: chatData.user)
//            }
//
//            if chatData.user != user{Spacer()}
//        }
//        .padding()
//        .id(chatData.id)
//    }
//}
//
//struct NickName {
//    @AppStorage("current_user") var user = ""
//
//    var name: String
//
//    var body: some View {
//
//        Text(String(name.first!))
//            .background((name == user ? Color.blue : Color.green).opacity(0.5))
//            .contextMenu{
//                Text(name)
//            }
//    }
//}
//
//struct ChatBubble: Shape {
//    var myMsg: Bool
//
//    func path(in rect: CGRect) -> Path{
//        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, myMsg ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 15, height: 15))
//
//        return Path(path.cgPath)
//    }
//}
//
//class HomeModel: ObservableObject{
//    @AppStorage("current_user") var user = ""
//
//    @Published var txt = ""
//    @Published var msgs: [MsgModel] = []
//
//    let ref = Firestore.firestore()
//
//    init() {
//        readAllMsgs()
//    }
//
//    func onAppear() {
//        if user == ""{
//            UIApplication.shared.windows.first?.rootViewController?.present(alertView(), animated: true)
//        }
//    }
//
//    func alertView() ->UIAlertController{
//        let alert = UIAlertController(title: "Join Chat", message: "Enter Nick", preferredStyle: .alert)
//
//        alert.addTextField { (txt) in
//            txt.placeholder = "support"
//        }
//
//        let join = UIAlertAction(title: "Join", style: .default) { (_) in
//            let user = alert.textFields![0].text ?? ""
//
//            if user != "" {
//                self.user = user
//                return
//            }
//
//            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
//        }
//        alert.addAction(join)
//
//        return alert
//    }
//
//    func readAllMsgs() {
//        ref.collection("Msgs").order(by: "timeStamp", descending: false).addShapshotListener { (snap, err) in
//            if err != nil {
//                print(err!.localizedDescription)
//                return
//            }
//
//            guard let data = snap else{return}
//
//            data.documentChanges.forEach { (doc) in
//                if doc.type == .added{
//                    let msg = try! doc.document.data(as: MsgModel.self)!
//
//                    DispatchQueue.main.async {
//                        self.msgs.append(msg)
//                    }
//                }
//            }
//        }
//    }
//
//    func writeMsg() {
//        let msg = MsgModel(msg: txt, user: user, timeStamp: Date())
//
//        let _ = try! ref.collection("Msgs").addDocument(from: msg) {(err) in
//            if err != nil {
//                print(err!.localizedDescription)
//                return
//            }
//        }
//        self.txt = ""
//    }
//
//}
//
//struct MsgModel: Codable, Identifiable, Hashable {
//    @DocumentID var id: String?
//    var msg: String
//    var user: String
//    var timeStamp: Date
//
//    enum CodingCase: String, CodingKey {
//        case id
//        case msg
//        case user
//        case timeStamp
//    }
//}
