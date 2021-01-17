//
//  FavoritesView.swift
//  Flow
//
//  Created by Vlad Novol on 15.01.2021.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var modelData: ModelData
//    @State private var animationAmount: CGFloat = 1
//        .padding(50)
//        .background(Color.offGray)
//        .clipShape(RoundedRectangle(cornerRadius: 20))
//        .overlay(RoundedRectangle(cornerRadius: 20)
//                    .stroke(Color.black)
//                    .scaleEffect(animationAmount)
//                    .opacity(Double(2 - animationAmount))
//                    .animation(
//                        Animation.easeInOut(duration: 1)
//                                    .repeatForever(autoreverses: false)
//                                  )
//        )
//        .onAppear{
//            self.animationAmount = 1.1
//        }
    
    @State var index = 1
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    @State var isMore = false

    var body: some View {
        NavigationView{
        ScrollView(showsIndicators: false) {
            VStack {
                HStack{
                    Text("Favorites Stores")
                        .foregroundColor(.gray)
                        .font(.system(size: 34, weight: .bold, design: .serif))
                    Spacer()
                    
                    Button {
                        withAnimation(.easeOut){
                            if self.columns.count == 2{
                                self.columns.removeLast()
                            }
                            else{
                                self.columns.append(GridItem(.flexible(), spacing: 15))
                            }
                        }
                    } label: {
                        Image(systemName: self.columns.count == 2 ? "rectangle.grid.2x2" : "rectangle.grid.1x2")
                            .font(.system(size: 24))
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal)
                .padding(.top,25)
                
                LazyVGrid(columns: self.columns,spacing: 25){
                    ForEach(modelData.stores[isMore ? 0..<5 : 0..<2]){store in
                        FlowerGridView(store: store, columns: self.$columns)
                    }
                }
                .padding([.horizontal,.top])
                Button(action: {
                    isMore = !isMore
                }, label: {
                    Text(isMore ? "Show less" : "More")
                        .font(.system(size: 20, weight: .bold, design: .serif))
                        .foregroundColor(.gray)

                })
                .frame(width: UIScreen.main.bounds.width*0.9, height: 100)
                .foregroundColor(.gray)
                .contentShape(RoundedRectangle(cornerRadius: 15.0))
                .background(
                    Group {
                        if isMore{
                            Group {
                                CustomTappedAccountButton3()
                            }
                        } else{
                            Group {
                                CustomConfirmButtonsView3()
                            }
                        }
                    }.padding()
                )
//                Button("Tap"){
//                    self.animationAmount += 1
//                }
//                .padding(50)
//                .background(Color.yellow)
//                .foregroundColor(.blue)
//                .clipShape(Circle())
//                .overlay(Circle()
//                            .stroke(Color.yellow)
//                            .scaleEffect(animationAmount)
//                            .opacity(Double(2 - animationAmount))
//                            .animation(
//                                Animation.easeInOut(duration: 1)
//                                            .repeatForever(autoreverses: false)
//                                          )
//                )
//                .onAppear{
//                    self.animationAmount = 2
//                }
            }
            .padding()
            }
        .background(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd))
        .navigationBarTitle("Favorites", displayMode: .inline)
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(ModelData())
    }
}
