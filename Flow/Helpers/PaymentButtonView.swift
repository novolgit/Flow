//
//  PaymentButtonView.swift
//  Flow
//
//  Created by Vlad Novol on 23.01.2021.
//

import SwiftUI
import PassKit

struct PaymentButtonView: View {
    
    var height: CGFloat {
        #if os(macOS)
        return 30
        #else
        return 45
        #endif
    }
    
    var body: some View {
        Representable()
            .frame(minWidth: 100, maxWidth: 250)
            .frame(height: height)
            .frame(maxWidth: .infinity)
            .accessibility(label: Text("Buy with Apple Pay"))
            .cornerRadius(25)
    }
}

extension PaymentButtonView {
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

struct PaymentButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PaymentButtonView()
                .padding()
                .preferredColorScheme(.light)
            PaymentButtonView()
                .padding()
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}
