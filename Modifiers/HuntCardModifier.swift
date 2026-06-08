//
//  HuntCardModifier.swift
//  iOSApp2
//
//  Created by Zubia Tahseen on 2026-06-08.
//

import SwiftUI

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

extension View {
    func huntCardStyle(isFound: Bool) -> some View {
        modifier(HuntCardModifier(isFound: isFound))
    }
}
