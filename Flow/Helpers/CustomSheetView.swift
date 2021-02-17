//
//  HistoryView.swift
//  Flow
//
//  Created by Vlad Novol on 04.01.2021.
//

import SwiftUI

fileprivate enum Constants {
    static let radius: CGFloat = 20
    static let indicatorHeight: CGFloat = 5
    static let indicatorWidth: CGFloat = 50
    static let snapRatio: CGFloat = 0.20
    static let minHeightRatio: CGFloat = UIScreen.main.bounds.height*0.000235
}

struct CustomSheetView: View {
    @Binding var isOpen: Bool
    
    @GestureState private var translation: CGFloat = 0
    
    let maxHeight: CGFloat
    let minHeight: CGFloat
    
    var coordinateImage: String
    var coordinateName: String
    var coordinateDescription: String
    var coordinatePhone: String
    var coordinateHours: String
    var coordinateCity: String
    var coordinateDays: String
    
    private var offset: CGFloat {
        isOpen ? 0 : maxHeight - minHeight
    }
    
    private var indicator: some View {
        Capsule()
            .fill(Color.gray.opacity(0.5))
            .frame(width: 50, height: 5)
            .padding(.top)
            .onTapGesture {
                self.isOpen.toggle()
                
            }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                self.indicator
                BottomSheet(coordinateImage: coordinateImage, coordinateName: coordinateName, coordinateDescription: coordinateDescription, coordinatePhone: coordinatePhone, coordinateHours: coordinateHours, coordinateCity: coordinateCity, coordinateDays: coordinateDays)
            }
            .background(BlurView())
            .frame(width: geometry.size.width, height: self.maxHeight, alignment: .top)
            .cornerRadius(Constants.radius)
            .frame(height: geometry.size.height, alignment: .bottom)
            .offset(y: max(self.offset + self.translation, 0))
            .cornerRadius(20)
            .animation(.interactiveSpring())
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.height
                }.onEnded { value in
                    let snapDistance = self.maxHeight * Constants.snapRatio
                    guard abs(value.translation.height) > snapDistance else {
                        return
                    }
                    self.isOpen = value.translation.height < 0
                }
            )
        }
    }
}

struct BottomSheet : View {
    @Environment(\.colorScheme) var colorScheme
    
    @State var rating = 3
    
    var coordinateImage: String
    var coordinateName: String
    var coordinateDescription: String
    var coordinatePhone: String
    var coordinateHours: String
    var coordinateCity: String
    var coordinateDays: String
    
    var body: some View{
        VStack {
            HStack {
                Text("Raiting")
                    .font(.system(size: 22, weight: .medium, design: .serif))
                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                Spacer()
                RatingView(rating: $rating)
            }
            .padding()
            GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        HStack {
                            Text("City")
                                .font(.system(size: 20, weight: .regular, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                            Spacer()
                            Text(coordinateCity)
                                .font(.system(size: 20, weight: .regular, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        HStack {
                            Text("Days")
                                .font(.system(size: 20, weight: .regular, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                            Spacer()
                            Text(coordinateDays)
                                .font(.system(size: 20, weight: .regular, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        HStack {
                            Text("Phone")
                                .font(.system(size: 20, weight: .regular, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                            Spacer()
                            Text(coordinatePhone)
                                .font(.system(size: 20, weight: .regular, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        HStack {
                            Text("Hours")
                                .font(.system(size: 20, weight: .regular, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                            Spacer()
                            Text(coordinateHours)
                                .font(.system(size: 20, weight: .regular, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        HStack {
                            Text("Show Assortment")
                                .font(.system(size: 20, weight: .regular, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                            Spacer()
                            NavigationLink(
                                destination: AssortmentDetailsView(),
                                label: {
                                    Image(systemName: "arrow.right")
                                })
                                .font(.system(size: 20, weight: .light, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        VStack {
                            Image(coordinateImage)
                                .resizable()
                                .frame(height: 250)
                                .cornerRadius(20)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Description")
                                    .font(.system(size: 24, weight: .medium, design: .serif))
                                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                Text(coordinateDescription)
                                    .font(.system(size: 20, weight: .regular, design: .serif))
                                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                            }
                            Spacer()
                        }
                    }
                    .padding()
                    .padding(.bottom, 49)
                }
                .background(
                    Group {
                        NeuButtonsView3(radius: 20, whiteColorOpacity: colorScheme == .dark ? Color.topShadowDark.opacity(0.2) : Color.topShadow.opacity(0.2), blackColorOpacity: colorScheme == .dark ? Color.bottomShadowDark.opacity(0.2) :  Color.bottomShadow.opacity(0.2), shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                    }
                )
                .frame(width: geometry.size.width)
            }
            .padding()
        }
    }
}

struct RatingView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var body: some View{
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            ForEach(1..<maximumRating + 1) { number in
                self.image(for: number)
                    .foregroundColor(number > self.rating ? colorScheme == .dark ? Color.offSecondaryGrayDark.opacity(0.1) : Color.offSecondaryGray.opacity(0.1) : colorScheme == .dark ? Color.offSecondaryGrayDark : Color.offSecondaryGray)
                    .onTapGesture {
                        self.rating = number
                    }
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct CustomSheetView2 : View {
    @State private var offset : CGFloat = 0
    
    var coordinateImage: String
    var coordinateName: String
    var coordinateDescription: String
    var coordinatePhone: String
    var coordinateHours: String
    var coordinateCity: String
    var coordinateDays: String
    
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            GeometryReader{reader in
                VStack{
                    BottomSheet(
                        coordinateImage: coordinateImage, coordinateName: coordinateName, coordinateDescription: coordinateDescription, coordinatePhone: coordinatePhone, coordinateHours: coordinateHours, coordinateCity: coordinateCity, coordinateDays: coordinateDays)
                        .background(BlurView())
                        .offset(y: reader.frame(in: .global).height - 175)
                        .offset(y: offset)
                        .gesture(DragGesture()
                                    .onChanged({ (value) in
                                        withAnimation(.easeOut(duration: 0.5)){
                                            if value.startLocation.y > reader.frame(in: .global).midX{
                                                if value.translation.height < 0 && offset > (-reader.frame(in: .global).height + 450){
                                                    offset = value.translation.height
                                                }
                                                //                                    offset = -450
                                            }
                                            if value.startLocation.y < reader.frame(in: .global).midX{
                                                if value.translation.height > 0 && offset < 0{
                                                    offset = (-reader.frame(in: .global).height + 450) + value.translation.height
                                                }
                                                //                                    offset = 0
                                            }
                                        }
                                    })
                                    .onEnded({ (value) in
                                        withAnimation(.easeIn){
                                            if value.startLocation.y > reader.frame(in: .global).midX{
                                                if -value.translation.height > reader.frame(in: .global).midX{
                                                    offset = (-reader.frame(in: .global).height + 450)
                                                    return
                                                }
                                                offset = 0
                                            }
                                            if value.startLocation.y < reader.frame(in: .global).midX{
                                                if value.translation.height < reader.frame(in: .global).midX{
                                                    offset = (-reader.frame(in: .global).height + 250)
                                                    return
                                                }
                                                offset = 0
                                            }
                                        }
                                    }))
                }
            }
            .ignoresSafeArea(.all, edges: .bottom)
        })
    }
}
