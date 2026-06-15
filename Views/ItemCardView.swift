//
//  ItemCardView.swift
//  iOSApp2
//
//  Created by Zubia Tahseen on 2026-06-08.
//

import SwiftUI

/// A compact card view for a single scavenger item, displayed within the grid on ItemListView.
/// Shows the user's photo if the item has been found, or an SF Symbol placeholder otherwise.
/// Uses the custom HuntCardModifier to style the card based on its found-state.
struct ItemCardView: View {
    let item: ScavengerItem

    var body: some View {
        VStack(spacing: 8) {
            // Show the captured photo if the item is found, otherwise a placeholder icon
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

            // Item name and business location
            Text(item.itemName)
                .font(.caption.bold())
                .multilineTextAlignment(.center)

            Text(item.businessName)
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .huntCardStyle(isFound: item.isFound)
    }
}
