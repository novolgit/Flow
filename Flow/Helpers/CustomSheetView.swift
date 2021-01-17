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

    let maxHeight: CGFloat
    let minHeight: CGFloat
//    let content: Content

    @GestureState private var translation: CGFloat = 0

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

//    init(isOpen: Binding<Bool>, maxHeight: CGFloat, @ViewBuilder content: () -> Content) {
//        self.minHeight = maxHeight * Constants.minHeightRatio
//        self.maxHeight = maxHeight*1.2
////        self.content = content()
//        self._isOpen = isOpen
//    }
    
    var coordinateImage: String
    var coordinateName: String
    var coordinateDescription: String
    var coordinatePhone: String
    var coordinateHours: String
    var coordinateCity: String

    var body: some View {
        GeometryReader { geometry in
            VStack{
                self.indicator
                BottomSheet(coordinateImage: coordinateImage, coordinateName: coordinateName, coordinateDescription: coordinateDescription, coordinatePhone: coordinatePhone, coordinateHours: coordinateHours, coordinateCity: coordinateCity)
                   
                
            }
            .frame(width: geometry.size.width, height: self.maxHeight, alignment: .top)
//            .background(Color(#colorLiteral(red: 0.9164158702, green: 0.9109681845, blue: 0.9206033349, alpha: 1)).opacity(0.9))
            .cornerRadius(Constants.radius)
            .frame(height: geometry.size.height, alignment: .bottom)
            .offset(y: max(self.offset + self.translation, 0))
            .background(BlurView(style: .extraLight))
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

//struct HistoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomSheetView(isOpen: .constant(false), maxHeight: 600) {
//            Rectangle()
//        }.edgesIgnoringSafeArea(.all)
//    }
//}

struct BottomSheet : View {
    
//    @State var txt = ""
//    @Binding var offset : CGFloat
//    var value : CGFloat
    var coordinateImage: String
    var coordinateName: String
    var coordinateDescription: String
    var coordinatePhone: String
    var coordinateHours: String
    var coordinateCity: String
    
    @State var rating = 3
    
    var body: some View{
            HStack {
                Text("Raiting")
                    .font(.system(size: 19, weight: .medium, design: .serif)).foregroundColor(.gray)
                Spacer()
                RatingView(rating: $rating)
            }
            .padding()
            Divider()
        ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        HStack {
                            Text("City")
                                .font(.system(size: 19, weight: .medium, design: .serif)).foregroundColor(.gray)
   
                            Spacer()
                            Text(coordinateCity)
                                .font(.system(size: 19, weight: .medium, design: .serif)).foregroundColor(.gray)
                        }
                        .padding(.vertical, 10)
                        HStack {
                            Text("Addres")
                                .font(.system(size: 19, weight: .medium, design: .serif)).foregroundColor(.gray)
   
                            Spacer()
                            Text("Lenina 71")
                                .font(.system(size: 19, weight: .medium, design: .serif)).foregroundColor(.gray)
   
                        }
                        .padding(.vertical, 10)
                        HStack {
                            Text("Hours")
                                .font(.system(size: 19, weight: .medium, design: .serif)).foregroundColor(.gray)
   
                            Spacer()
                            Text(coordinateHours)
                                .font(.system(size: 19, weight: .medium, design: .serif)).foregroundColor(.gray)
                        }
                        .padding(.vertical, 10)
                        HStack {
                            Text("Phone")
                                .font(.system(size: 19, weight: .medium, design: .serif)).foregroundColor(.gray)
   
                            Spacer()
                            Text(coordinatePhone)
                                .font(.system(size: 19, weight: .medium, design: .serif)).foregroundColor(.gray)
                        }
                        .padding(.vertical, 10)
                        HStack {
                            Text("Show Assortment")
                                .font(.system(size: 19, weight: .medium, design: .serif)).foregroundColor(.gray)
   
                            Spacer()
                                NavigationLink(
                                    destination: AssortmentDetailsView(),
                                    label: {
                                        Image(systemName: "eye")
                                    })
                                .font(.system(size: 19, weight: .medium, design: .serif)).foregroundColor(.gray)
                        }
                        .padding(.vertical, 10)
                        VStack {
                            Image(coordinateImage)
                                .resizable()
                                .cornerRadius(20)
                                .frame(width: UIScreen.main.bounds.width*0.84, height: UIScreen.main.bounds.height*0.26)
                            
                                .padding(.vertical, 10)
                        }
                        .frame(width: UIScreen.main.bounds.width*0.87, height: UIScreen.main.bounds.height*0.28)
//                        .background(
//                            Group {
//                                NeuButtonsView2(radius: 20, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
//                            }
//                        )
//                        .padding()
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Description")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 24, weight: .bold, design: .serif))
                                Text(coordinateDescription)
                                    .font(.system(size: 19, weight: .medium, design: .serif)).foregroundColor(.gray)
       
                            }
                            Spacer()
                        }
                        .padding(.vertical, 10)
                }
                .padding()
//                VStack{}.frame(height: 60)
            }
            .frame(width: UIScreen.main.bounds.width*0.93, height: 435)
            .background(
                Group {
                    NeuButtonsView2(radius: 20, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                }
            )
            .padding()
    }
}

struct BlurView : UIViewRepresentable {
    
    var style : UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView{
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
        
    }
}

struct RatingView: View {
    @Binding var rating: Int

    var label = ""

    var maximumRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View{
        HStack {
            if label.isEmpty == false {
                Text(label)
            }

            ForEach(1..<maximumRating + 1) { number in
                self.image(for: number)
                    .foregroundColor(number > self.rating ? self.offColor : self.onColor)
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
    
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            
            
            GeometryReader{reader in
            
                VStack{
                    
                    BottomSheet(
//                        offset: $offset, value: (-reader.frame(in: .global).height + 150),
                                coordinateImage: coordinateImage, coordinateName: coordinateName, coordinateDescription: coordinateDescription, coordinatePhone: coordinatePhone, coordinateHours: coordinateHours, coordinateCity: coordinateCity)
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
