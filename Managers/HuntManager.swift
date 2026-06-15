//
//  HuntManager.swift
//  iOSApp2
//
//  Created by Zubia Tahseen on 2026-06-08.
//

import SwiftUI

/// Central state manager for the scavenger hunt.
/// Uses @Observable so SwiftUI views automatically update when properties change.
/// Tracks the list of scavenger items, whether the hunt has started/been submitted,
/// and provides methods to mark items as found or reset the hunt.
@Observable
class HuntManager {
    /// The full list of scavenger items, each tracking its found-state and photo.
    var items: [ScavengerItem] = ScavengerItem.allItems

    /// Whether the user has tapped "Start Hunt" from the home screen.
    var huntStarted: Bool = false

    /// Whether the user has submitted their results on the results screen.
    var huntSubmitted: Bool = false

    /// Elapsed time for the hunt (reserved for future timer feature).
    var timeElapsed: TimeInterval = 0

    /// Convenience: number of items the user has found so far.
    var foundCount: Int { items.foundCount }

    /// Convenience: the reward tier earned based on how many items were found.
    var rewardTier: RewardTier { items.rewardTier }

    /// Marks a specific item as found and attaches the user's photo to it.
    func markFound(id: Int, photo: UIImage) {
        if let index = items.firstIndex(where: { $0.id == id }) {
            items[index].isFound = true
            items[index].photo = photo
        }
    }

    /// Records that the user has submitted their hunt results.
    func submitHunt() {
        huntSubmitted = true
    }

    /// Resets all hunt state so the user can play again from scratch.
    func resetHunt() {
        items = ScavengerItem.allItems
        huntStarted = false
        huntSubmitted = false
        timeElapsed = 0
    }
}
