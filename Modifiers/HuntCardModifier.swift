//
//  HuntCardModifier.swift
//  iOSApp2
//
//  Created by Zubia Tahseen on 2026-06-08.
//

import SwiftUI

/// A custom ViewModifier that styles scavenger hunt item cards.
/// Found items get a green tinted background and border with a subtle scale-up animation;
/// unfound items display a neutral gray card style.
struct HuntCardModifier: ViewModifier {
    let isFound: Bool

    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity)
            .background(isFound ? Color.green.opacity(0.1) : Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isFound ? Color.green : Color.clear, lineWidth: 2)
            )
            .scaleEffect(isFound ? 1.02 : 1.0)
            .animation(.spring(), value: isFound)
    }
}

/// Convenience extension so any view can apply the hunt card style with a simple modifier call.
extension View {
    func huntCardStyle(isFound: Bool) -> some View {
        modifier(HuntCardModifier(isFound: isFound))
    }
}
