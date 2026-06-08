//
//  ItemCardView.swift
//  iOSApp2
//
//  Created by Zubia Tahseen on 2026-06-08.
//

import SwiftUI

struct ItemCardView: View {
    let item: ScavengerItem

    var body: some View {
        VStack(spacing: 8) {
            // Show photo if found, otherwise show a placeholder icon
            if let photo = item.photo {
                Image(uiImage: photo)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 100)
                    .clipped()
            } else {
                Image(systemName: item.isFound ? "checkmark.seal.fill" : "questionmark.circle")
                    .font(.system(size: 40))
                    .foregroundStyle(item.isFound ? .green : .secondary)
                    .frame(height: 100)
            }

            Text(item.itemName)
                .font(.caption.bold())
                .multilineTextAlignment(.center)

            Text(item.businessName)
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .huntCardStyle(isFound: item.isFound)  // custom view modifier (see below)
    }
}


