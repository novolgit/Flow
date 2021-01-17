//
//  Animations.swift
//  Flow
//
//  Created by Vlad Novol on 16.01.2021.
//

import SwiftUI

struct Animations_Previews: PreviewProvider {
    static var previews: some View {
        Animations()
    }
}

struct Animations: View {
    @State private var fontSize: CGFloat = 32
    var body: some View {
        Text("Hello, World!")
            .animatableFont(name: "Georgia", size: fontSize)
            .onTapGesture {
                withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1).repeatForever()) {
                    self.fontSize = 144
                }
            }
    }
}

struct AnimatableCustomFontModifier: AnimatableModifier {
    var name: String
    var size: CGFloat

    var animatableData: CGFloat {
        get { size }
        set { size = newValue }
    }

    func body(content: Content) -> some View {
        content
            .font(.custom(name, size: size))
    }
}

extension View {
    func animatableFont(name: String, size: CGFloat) -> some View {
        self.modifier(AnimatableCustomFontModifier(name: name, size: size))
    }
}

struct AnimatableSystemFontModifier: AnimatableModifier {
    var size: CGFloat
    var weight: Font.Weight
    var design: Font.Design

    var animatableData: CGFloat {
        get { size }
        set { size = newValue }
    }

    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight, design: design))
    }
}

extension View {
    func animatableSystemFont(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View {
        self.modifier(AnimatableSystemFontModifier(size: size, weight: weight, design: design))
    }
}
