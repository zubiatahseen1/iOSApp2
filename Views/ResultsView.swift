//
//  ResultsView.swift
//  iOSApp2
//
//  Created by Zubia Tahseen on 2026-06-08.
//

import SwiftUI

/// Displays the final results after the user submits their scavenger hunt.
/// Shows a reward icon, the number of items found, the earned reward tier message,
/// a photo summary grid of all items, and a "Play Again" button to reset the hunt.
struct ResultsView: View {
    @Environment(HuntManager.self) var huntManager
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 32) {

            // Reward icon — changes based on the tier earned
            Image(systemName: rewardIcon)
                .font(.system(size: 80))
                .foregroundStyle(rewardColor)

            Text("Hunt Complete!")
                .font(.largeTitle.bold())

            // Found count summary
            Text("You found \(huntManager.foundCount) out of 10 items")
                .font(.title3)
                .foregroundStyle(.secondary)

            // Reward tier message and discount code (if earned)
            VStack(spacing: 12) {
                Text(huntManager.rewardTier.message)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                if let code = huntManager.rewardTier.discountCode {
                    Text(code)
                        .font(.title.bold().monospaced())
                        .padding()
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }

            // Photo summary grid — shows captured photos or placeholder X marks
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                    ForEach(huntManager.items) { item in
                        if let photo = item.photo {
                            Image(uiImage: photo)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 80)
                                .clipped()
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        } else {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(.systemGray5))
                                .frame(height: 80)
                                .overlay(
                                    Image(systemName: "xmark")
                                        .foregroundStyle(.secondary)
                                )
                        }
                    }
                }
                .padding(.horizontal)
            }

            // Reset button — clears all state and returns to the hunt list
            Button("Play Again") {
                huntManager.resetHunt()
                dismiss()
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
        }
        .padding()
        .onAppear {
            huntManager.submitHunt()
        }
    }

    // MARK: - Reward Display Helpers

    /// Maps the current reward tier to an appropriate SF Symbol icon name.
    private var rewardIcon: String {
        switch huntManager.rewardTier {
        case .grandPrize:    return "trophy.fill"
        case .twentyPercent: return "star.fill"
        case .tenPercent:    return "tag.fill"
        case .none:          return "figure.walk"
        }
    }

    /// Maps the current reward tier to a display color for the icon.
    private var rewardColor: Color {
        switch huntManager.rewardTier {
        case .grandPrize:    return .yellow
        case .twentyPercent: return .orange
        case .tenPercent:    return .blue
        case .none:          return .secondary
        }
    }
}
