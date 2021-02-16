//
//  ConfirmPage2View.swift
//  Flow
//
//  Created by Vlad Novol on 22.01.2021.
//

import SwiftUI
import Combine

struct ConfirmPage2View: View {
    @Environment(\.colorScheme) var colorScheme
    
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
                    ZStack {
                        Image(systemName: "chevron.left.circle.fill")
                            .resizable()
                            .frame(width: 38, height: 36)
                            .foregroundColor(colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray)
                            .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 3, x: 3, y: 3)
                            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: -1.5, y: -1.5)
                        Image(systemName: "chevron.left")
                            .resizable()
                            .font(.system(size: 10, weight: .light, design: .serif))
                            .frame(width: 11, height: 19)
                            .foregroundColor(colorScheme == .dark ? Color.offSecondaryGrayDark.opacity(0.5) : Color.offSecondaryGray.opacity(0.5))
                            .offset(x: -1)
                    }
                })
                Spacer()
                Button(action: {
                    currentPage += 1
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                }, label: {
                    ZStack {
                        Image(systemName: "chevron.right.circle.fill")
                            .resizable()
                            .frame(width: 38, height: 36)
                            .foregroundColor(colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray)
                            .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 3, x: 3, y: 3)
                            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: -1.5, y: -1.5)
                        Image(systemName: "chevron.right")
                            .resizable()
                            .font(.system(size: 10, weight: .light, design: .serif))
                            .frame(width: 11, height: 19)
                            .foregroundColor(colorScheme == .dark ? Color.offSecondaryGrayDark.opacity(0.5) : Color.offSecondaryGray.opacity(0.5))
                            .offset(x: 1)
                    }
                })
            }
            .padding()
            HStack{
                Button(action: {
                    isTap = true
                }) {
                    HStack {
                        Image(systemName: "figure.stand.line.dotted.figure.stand")
                            .font(.system(size: 26, weight: .regular, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        Text("Delivery")
                            .font(.system(size: 20, weight: .regular, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width*0.48, height: 110)
                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
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
                Spacer()
                Button(action: {
                    isTap = false
                }) {
                    HStack {
                        Image(systemName: "figure.walk")
                            .font(.system(size: 26, weight: .regular, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        Text("pickup")
                            .font(.system(size: 20, weight: .regular, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        
                    }
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
            }
            if isTap{
                HStack{
                    HStack{
//                        Text("Addres")
//                            .font(.system(size: 20, design: .serif))
//                            .foregroundColor(addresEmpty ? Color.red : Color.black)
                        Image(systemName: "location")
                            .font(.system(size: 20, weight: .light, design: .serif))
                            .foregroundColor(addresEmpty ? Color.redd : .offSecondaryGray)
                            .scaleEffect(!addresEmpty ? 1 : 1.25)
                            TextField("addres", text: $addres)
                                .font(.system(size: 20, weight: .light, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
//                        Divider()
                        
                    }
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Text("Map")
                                .font(.system(size: 20, weight: .light, design: .serif))
                                .foregroundColor(Color(.systemBlue))
                            Image(systemName: "map")
                                .foregroundColor(Color(.systemBlue))
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
                            .font(.system(size: 20, weight: .light, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
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
                            .font(.system(size: 20, weight: .light, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
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
                        .font(.system(size: 20, weight: .light, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    TextField("phone", text: $phone)
                        .font(.system(size: 20, weight: .light, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
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
                        .font(.system(size: 20, weight: .light, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
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
                        NeuButtonsView2(radius: 15, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
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
                            .foregroundColor(addresEmpty ? Color.redd : Color.black)
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
                        .font(.system(size: 20, weight: .light, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        
                        //                                .datePickerStyle(GraphicalDatePickerStyle())
                    }
                    .padding()
                    .frame(height: 60)
                    .background(
                        Group {
                            NeuButtonsView2(radius: 15, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
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
                    .font(.system(size: 26, weight: .regular, design: .serif))
                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    .animation(.easeOut(duration:0.8))
                
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
                                .font(.system(size: 20, weight: .light, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray))
    }
}
