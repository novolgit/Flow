//
//  PaymentButtonView.swift
//  Flow
//
//  Created by Vlad Novol on 23.01.2021.
//

import SwiftUI
import PassKit

struct PayWithAppleView: View {
    @Environment(\.colorScheme) var colorScheme
    
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
            .font(.system(size: 20, weight: .light, design: .serif))
            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
            .cornerRadius(25)
    }
}

struct PaymentButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PayWithAppleView()
                .padding()
                .preferredColorScheme(.light)
            PayWithAppleView()
                .padding()
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}
