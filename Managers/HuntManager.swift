//
//  HuntManager.swift
//  iOSApp2
//
//  Created by Zubia Tahseen on 2026-06-08.
//

import SwiftUI

@Observable
class HuntManager {
    var items: [ScavengerItem] = ScavengerItem.allItems
    var huntStarted: Bool = false
    var huntSubmitted: Bool = false
    var timeElapsed: TimeInterval = 0

    var foundCount: Int { items.foundCount }
    var rewardTier: RewardTier { items.rewardTier }

    func markFound(id: Int, photo: UIImage) {
        if let index = items.firstIndex(where: { $0.id == id }) {
            items[index].isFound = true
            items[index].photo = photo
        }
    }

    func submitHunt() {
        huntSubmitted = true
        // TODO: connect to backend/API later
    }

    func resetHunt() {
        items = ScavengerItem.allItems
        huntStarted = false
        huntSubmitted = false
        timeElapsed = 0
    }
}
