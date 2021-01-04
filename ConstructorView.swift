//
//  ConstructorView.swift
//  Flow
//
//  Created by Vlad Novol on 30.12.2020.
//

import SwiftUI

struct ConstructorView: View {
    @State private var showChoose = false
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            HStack{
                Text("1479$")
                Spacer()
                Button(action: {
                    self.showChoose.toggle()
                }) {
                    Image(systemName: "chevron.up")
                }
                .fullScreenCover(isPresented: $showChoose, content: FullScreenModalView.init)
            }
            .cornerRadius(20)
            .padding()
            .background(Color.pink.opacity(0.1))
        }
        .background(Color.white)
        
    }
}

struct ConstructorView_Previews: PreviewProvider {
    static var previews: some View {
        ConstructorView()
    }
}

struct FullScreenModalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Spacer()
        VStack {
            HStack{
                Text("1479$")
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.down")
                        .foregroundColor(.red)
                }
            }
            Spacer()
            Text("Construct List")
        }
        .padding()
        .frame(maxWidth: 400, maxHeight: 400)
        .background(Color.pink.opacity(0.1))
        .cornerRadius(20)
    }
}

