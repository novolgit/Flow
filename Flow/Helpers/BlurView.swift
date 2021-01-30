//
//  BlurView.swift
//  Flow
//
//  Created by Vlad Novol on 22.01.2021.
//

import SwiftUI

struct BlurView: UIViewRepresentable {

    func makeUIView(context: Context) -> UIVisualEffectView {
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
        
    }
}
