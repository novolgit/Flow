//
//  ConfirmView.swift
//  Flow
//
//  Created by Vlad Novol on 31.12.2020.
//
import MapKit
import SwiftUI

struct ConfirmView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var currentPage = 0
    @State private var keyboardHeight: CGFloat = 0
    
    var totalPrice: Double 
    var coordinate: CLLocationCoordinate2D
    var coordinateName: String
    
    var body: some View {
        VStack{
            IndicatorView(currentPage: currentPage)
                .ignoresSafeArea(edges: .top)
            PagerView(pageCount: 4, currentIndex: $currentPage) {
                ConfirmPage1View(currentPage: $currentPage, totalPrice: totalPrice, coordinate: coordinate, coordinateName: coordinateName)
                    .animation(.spring())
                ConfirmPage2View(currentPage: $currentPage, totalPrice: totalPrice)
                    .animation(.spring())
                    .onTapGesture {
                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                        impactMed.impactOccurred()
                    }
                ConfirmPage3View(currentPage: $currentPage, totalPrice: totalPrice)
                    .animation(.spring())
                Text("Succes order confirm")
                    .animation(.spring())
            }
        }
        .offset(y: -self.keyboardHeight)
        .onAppear{
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in
                let keyboardHeight = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                let height = keyboardHeight.height
                self.keyboardHeight = height
            }
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in
                self.keyboardHeight = 0
            }
        }
        .background(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
    }
}

struct ConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmView(totalPrice: 0.0, coordinate: CLLocationCoordinate2D(), coordinateName: "")
    }
}


struct PagerView<Content: View>: View {
    let pageCount: Int
    @Binding var currentIndex: Int
    let content: Content
    
    @GestureState private var translation: CGFloat = 0
    
    init(pageCount: Int, currentIndex: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                self.content.frame(width: geometry.size.width)
            }
            .frame(width: geometry.size.width, alignment: .leading)
            .offset(x: -CGFloat(self.currentIndex) * geometry.size.width)
            .offset(x: self.translation)
            .animation(.interactiveSpring())
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.width
                }.onEnded { value in
                    let offset = value.translation.width / geometry.size.width
                    let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                    self.currentIndex = min(max(Int(newIndex), 0), self.pageCount - 1)
                }
            )
        }
    }
}
