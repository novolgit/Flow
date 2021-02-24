//
//  Extentions.swift
//  Flow
//
//  Created by Vlad Novol on 2/12/21.
//

import Foundation
import SwiftUI
import Combine
import PassKit

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension Color {
    ///lightMode
    static let offWhite = Color.init(hex: "#ffffff")
    static let offGray = Color(#colorLiteral(red: 0.9215686275, green: 0.937254902, blue: 0.9490196078, alpha: 1))
    static let topShadow = Color.init(hex: "#ffffff")
    static let bottomShadow = Color.init(hex: "#5e6061")
    static let offSecondaryGray = Color(#colorLiteral(red: 0.122, green: 0.1215686275, blue: 0.1215686275, alpha: 1))
    
    static let offGrayLinearStart = Color(#colorLiteral(red: 0.9215686275, green: 0.937254902, blue: 0.9490196078, alpha: 1))
    static let offGrayLinearEnd = Color(#colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1))
    
    ///darkMode
    static let offWhiteDark = Color.init(hex: "#ffffff")
    static let offGrayDark = Color(#colorLiteral(red: 0.1019607843, green: 0.1019607843, blue: 0.1019607843, alpha: 1))
    static let topShadowDark = Color.init(hex: "#2a2a2a")
    static let bottomShadowDark = Color.init(hex: "#0a0a0a")
    static let offSecondaryGrayDark = Color(#colorLiteral(red: 0.878, green: 0.8784313725, blue: 0.8784313725, alpha: 1))
    
    static let offGrayLinearStartDark = Color(#colorLiteral(red: 0.07843137255, green: 0.09411764706, blue: 0.1058823529, alpha: 1))
    static let offGrayLinearEndDark = Color(#colorLiteral(red: 0.09803921569, green: 0.09803921569, blue: 0.09803921569, alpha: 1))
    
    ///red
    static let redd = Color.init(hex: "#9a151a")
    static let reddDark = Color.init(hex: "#9a151a")
    //    static let reddDark = Color.init(hex: "#fc5d3f")
    
    ///yellow
    static let yelloww = Color.init(hex: "#ffd200")
    static let yellowwDark = Color.init(hex: "#fce185")
    
    ///green
    static let greenn = Color.init(hex: "#2b9a7d")
    static let greennDark = Color.init(hex: "#4fdcb8")
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .bottomTrailing, endPoint: .topLeading)
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.7)
            .speed(2.5)
            .delay(0.14 * Double(index))
    }
}

extension UIView {
    func asImage() -> UIImage {
        let format = UIGraphicsImageRendererFormat()
        format.scale = 1
        return UIGraphicsImageRenderer(size: self.layer.frame.size, format: format).image { context in
            self.drawHierarchy(in: self.layer.bounds, afterScreenUpdates: true)
        }
    }
}
extension View {
    func asImage(size: CGSize) -> UIImage {
        let controller = UIHostingController(rootView: self)
        controller.view.bounds = CGRect(origin: .zero, size: size)
        let image = controller.view.asImage()
        return image
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}

extension String {
    func separating(every: Int, separator: String) -> String {
        let regex = #"(.{\#(every)})(?=.)"#
        return self.replacingOccurrences(of: regex, with: "$1\(separator)", options: [.regularExpression])
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

extension UIApplication {
    func addTapGestureRecognizer() {
        guard let window = windows.first else { return }
        let tapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapGesture.requiresExclusiveTouchType = false
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        window.addGestureRecognizer(tapGesture)
    }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
}

extension PayWithAppleView {
    #if os(iOS)
    typealias ViewRepresentable = UIViewRepresentable
    #else
    typealias ViewRepresentable = NSViewRepresentable
    #endif
    
    struct Representable: ViewRepresentable {
        
        
        func makeCoordinator() -> Coordinator {
            Coordinator()
        }
        
        #if os(iOS)
        func makeUIView(context: Context) -> UIView {
            context.coordinator.button
        }
        
        func updateUIView(_ rootView: UIView, context: Context) {
        }
        #else
        func makeNSView(context: Context) -> NSView {
            context.coordinator.button
        }
        
        func updateNSView(_ rootView: NSView, context: Context) {
        }
        #endif
    }
    
    class Coordinator: NSObject {
        var button = PKPaymentButton(paymentButtonType: .buy, paymentButtonStyle: .automatic)
        
        @objc
        func callback(_ sender: Any) {
        }
    }
}

extension UIImage {
    func toString() -> String? {
        let data: Data? = self.pngData()
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
}
