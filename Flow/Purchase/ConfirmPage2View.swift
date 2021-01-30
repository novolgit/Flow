//
//  ConfirmPage2View.swift
//  Flow
//
//  Created by Vlad Novol on 22.01.2021.
//

import SwiftUI
import Combine

struct ConfirmPage2View: View {
    @State private var entrance: String = ""
    @State private var floor: String = ""
    @State private var kv: String = ""
    @State private var phone: String = ""
    @State private var addres: String = ""
    @State private var comments: String = ""
    @State private var tipAmount = ""
    @State private var isTap: Bool = true
    @State private var pickupTime = Date()
    @State private var addresEmpty: Bool = false
    @State private var keyboardHeight: CGFloat = 0
    
    @Namespace private var namespace
    
    @Binding var currentPage: Int
    
    var totalPrice: Double
    var range: ClosedRange<Date>{
        let now = Date().addingTimeInterval(1800)
        let tomorrow = Date().addingTimeInterval(86400)
        
        return now...tomorrow
    }
    
    var body: some View {
        ScrollView(showsIndicators: false){
            HStack{
                Button(action: {
                    currentPage -= 1
                    let impactMed = UIImpactFeedbackGenerator(style: .rigid)
                    impactMed.impactOccurred()
                }, label: {
                    Image(systemName: "chevron.left.circle")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .padding(7)
                        .background(
                            Group {
                                NeuButtonsView2(radius: 100, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 2, xBlack: 4, yBlack: 4, xWhite: -2, yWhite: -2)
                            }
                        )
                })
                Spacer()
                Button(action: {
                    currentPage += 1
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                }, label: {
                    Image(systemName: "chevron.right.circle")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .padding(7)
                        .background(
                            Group {
                                NeuButtonsView2(radius: 100, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 2, xBlack: 4, yBlack: 4, xWhite: -2, yWhite: -2)
                            }
                        )
                })
            }
            .padding()
            HStack{
                Button(action: {
                    isTap = true
                }) {
                    HStack {
                        Image(systemName: "figure.stand.line.dotted.figure.stand")
                            .font(.title)
                            .foregroundColor(Color(#colorLiteral(red: 0.1215686275, green: 0.1215686275, blue: 0.1215686275, alpha: 1)))
                        Text("Delivery")
                            .font(.system(size: 20, weight: .light, design: .serif))
                            .foregroundColor(Color(#colorLiteral(red: 0.1215686275, green: 0.1215686275, blue: 0.1215686275, alpha: 1)))
                        
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width*0.48, height: 110)
                    .foregroundColor(.gray)
                    .contentShape(RoundedRectangle(cornerRadius: 15.0))
                    .background(
                        Group {
                            if !isTap{
                                Group {
                                    CustomTappedAccountButton3()
                                }
                            } else{
                                Group {
                                    CustomConfirmButtonsView3()
                                }
                            }
                        }.padding().animation(nil)
                    )
                }
                Spacer()
                Button(action: {
                    isTap = false
                }) {
                    HStack {
                        Image(systemName: "figure.walk")
                            .font(.title)
                            .foregroundColor(Color(#colorLiteral(red: 0.1215686275, green: 0.1215686275, blue: 0.1215686275, alpha: 1)))
                        Text("pickup")
                            .font(.system(size: 20, weight: .light, design: .serif))
                            .foregroundColor(Color(#colorLiteral(red: 0.1215686275, green: 0.1215686275, blue: 0.1215686275, alpha: 1)))
                        
                    }
                    .frame(width: UIScreen.main.bounds.width*0.48, height: 110)
                    .foregroundColor(.gray)
                    .contentShape(RoundedRectangle(cornerRadius: 15.0))
                    .background(
                        Group {
                            if isTap{
                                Group {
                                    CustomTappedAccountButton3()
                                }
                            } else{
                                Group {
                                    CustomConfirmButtonsView3()
                                }
                            }
                        }.padding().animation(nil)
                    )
                }
            }
            if isTap{
                HStack{
                    HStack{
//                        Text("Addres")
//                            .font(.system(size: 20, design: .serif))
//                            .foregroundColor(addresEmpty ? Color.red : Color.black)
                        Image(systemName: "location")
                            .foregroundColor(addresEmpty ? Color.red : Color.black)
                            .scaleEffect(!addresEmpty ? 1 : 1.25)
                            TextField("addres", text: $addres)
                                .font(.system(size: 20, design: .serif))
//                        Divider()
                        
                    }
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Text("Map")
                            Image(systemName: "map")
                        }
                    })
                }
                .padding()
                .frame(height: 60)
                .background(
                        Group {
                            if addres.isEmpty {CustomConfirmButtonsView5()}
                            else {CustomTappedAccountButton5()}
                        }
                )
                .padding(.horizontal,16)
                .padding(.vertical,3)
                HStack{
                        TextField("entrance", text: $entrance)
                            .font(.system(size: 20, design: .serif))
                            .foregroundColor(.gray)
                            .keyboardType(.decimalPad)
                    .padding()
                    .frame(height: 60)
                    .background(
                        Group {
                            Group {
                                if entrance.isEmpty {CustomConfirmButtonsView5()}
                                else {CustomTappedAccountButton5()}
                            }
                        }
                    )
                    .padding(.trailing,10)
                    VStack(alignment: .leading){
//                        Text("Floor")
//                            .font(.system(size: 20, design: .serif))
                        
                        TextField("floor", text: $floor)
                            .font(.system(size: 20, design: .serif))
                            .foregroundColor(.gray)
                            .keyboardType(.decimalPad)
//                        Divider()
                    }
                    .padding()
                    .frame(height: 60)
                    .background(
                        Group {
                            Group {
                                if floor.isEmpty {CustomConfirmButtonsView5()}
                                else {CustomTappedAccountButton5()}
                            }
                        }
                    )
                    .padding(.leading,10)
                }
                .padding(.horizontal,16)
                .padding(.vertical,3)
                HStack{
//                    Text("Phone")
//                        .font(.system(size: 20, design: .serif))
                    Image(systemName: "phone")
                    TextField("phone", text: $phone)
                        .font(.system(size: 20, design: .serif))
                        .foregroundColor(.gray)
                        .keyboardType(.phonePad)
//                    Divider()
                }
                .padding()
                .frame(height: 60)
                .background(
                    Group {
                        Group {
                            if phone.isEmpty {CustomConfirmButtonsView5()}
                            else {CustomTappedAccountButton5()}
                        }
                    }
                )
                .padding(.horizontal,16)
                .padding(.vertical,3)
                .matchedGeometryEffect(id: "phone", in: self.namespace)
                HStack{
                    Image(systemName: "timer")
                    DatePicker(
                        "Time",
                        selection: $pickupTime,
                        in: range,
                        displayedComponents: .hourAndMinute
                    )
                    .font(.system(size: 20, design: .serif))
                    .foregroundColor(.gray)
                    .datePickerStyle(GraphicalDatePickerStyle())
                }
                .padding()
                .frame(height: 60)
                .background(
                    Group {
                        NeuButtonsView2(radius: 15, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                    }
                )
                .padding(.horizontal,16)
                .padding(.vertical,3)
                .matchedGeometryEffect(id: "time", in: self.namespace)
            } else{
                VStack{
                    HStack{
//                        Text("Phone")
//                            .font(.system(size: 20, design: .serif))
                        Image(systemName: "phone")
                            .foregroundColor(addresEmpty ? Color.red : Color.black)
                        TextField("phone", text: $phone)
                            .font(.system(size: 20, design: .serif))
                            .keyboardType(.decimalPad)
//                        Divider()
                    }
                    .padding()
                    .frame(height: 60)
                    .background(
                        Group {
                            Group {
                                if phone.isEmpty {CustomConfirmButtonsView5()}
                                else {CustomTappedAccountButton5()}
                            }
                        }
                    )
                    .padding(.horizontal,16)
                    .padding(.vertical,3)
                    .matchedGeometryEffect(id: "phone", in: self.namespace)
                    HStack{
                        Image(systemName: "timer")
                        DatePicker(
                            "Time",
                            selection: $pickupTime,
                            in: range,
                            displayedComponents: .hourAndMinute
                        )
                        .font(.system(size: 20, design: .serif))
                        .foregroundColor(.gray)
                        
                        //                                .datePickerStyle(GraphicalDatePickerStyle())
                    }
                    .padding()
                    .frame(height: 60)
                    .background(
                        Group {
                            NeuButtonsView2(radius: 15, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                        }
                    )
                    .padding(.horizontal,16)
                    .padding(.vertical,3)
                    .matchedGeometryEffect(id: "time", in: self.namespace)
                }
            }
            Button(action: {
                if isTap{
                    if !addres.isEmpty
//                        || !entrance.isEmpty || !floor.isEmpty || !phone.isEmpty
                    {
                        currentPage += 1
                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                        impactMed.impactOccurred()
                    } else {
                        addresEmpty = true
                    }
                }else{
                    if !phone.isEmpty {
                        currentPage += 1
                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                        impactMed.impactOccurred()
                    }
                }
            }, label: {
                Text("Next")
                    .foregroundColor(.gray)
                    .font(.system(size: 24, weight: .medium, design: .serif))
                
            })
            .frame(width: 350, height: 100)
            .background(
                Group {
                    if isTap{
                        if addres.isEmpty || entrance.isEmpty || floor.isEmpty || phone.isEmpty {
                            Group {
                                CustomConfirmButtonsView3()
                            }
                        } else{
                            Group {
                                CustomTappedAccountButton3()
                            }
                        }
                    }else{
                        if phone.isEmpty {
                            Group {
                                CustomConfirmButtonsView3()
                            }
                        } else{
                            Group {
                                CustomTappedAccountButton3()
                            }
                        }
                    }
                }.padding()
            )
            .padding(.horizontal,16)
//            .keyboardAdaptive()
            .animation(.easeOut(duration:0.8))
            VStack{}.frame(height: 40)
        }
//        .keyboardAdaptive()
        .navigationBarTitle("Order Data", displayMode: .inline)
        .navigationBarItems(trailing: Text(String(totalPrice))
                                .font(.system(size: 20, design: .serif))
                                .foregroundColor(Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))))
    }
}
