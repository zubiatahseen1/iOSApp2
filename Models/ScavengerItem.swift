//
//  ScavengerItem.swift
//  iOSApp2
//
//  Created by Zubia Tahseen on 2026-06-08.
//

import UIKit

struct ScavengerItem: Identifiable {
    let id: Int
    let businessName: String
    let address: String
    let itemName: String
    let clue: String
    var isFound: Bool = false
    var photo: UIImage? = nil
}

// MARK: - Array Helpers
extension Array where Element == ScavengerItem {
    var foundCount: Int {
        filter(\.isFound).count
    }

    var rewardTier: RewardTier {
        switch foundCount {
        case 10:       return .grandPrize
        case 7...9:    return .twentyPercent
        case 5...6:    return .tenPercent
        default:       return .none
        }
    }
}

// MARK: - Sample Data
extension ScavengerItem {
    static let allItems: [ScavengerItem] = [
        ScavengerItem(
            id: 1,
            businessName: "Tim Hortons",
            address: "King St W, Toronto",
            itemName: "Double Double Cup",
            clue: "Canada runs on something warm and familiar. Find the spot where hockey dads and morning commuters speak the same language — and look for the cup that orders itself."
        ),
        ScavengerItem(
            id: 2,
            businessName: "Indigo Books & Music",
            address: "Bloor St, Toronto",
            itemName: "Bestseller Bookmark",
            clue: "Between the covers of a thousand worlds, something marks the place where a story pauses. Find the shelf where readers linger longest."
        ),
        ScavengerItem(
            id: 3,
            businessName: "Scotiabank Theatre",
            address: "Richmond St W, Toronto",
            itemName: "Popcorn Box",
            clue: "The lights go down, the screen lights up, and something salty waits in your hands. Find where Toronto watches its blockbusters."
        ),
        ScavengerItem(
            id: 4,
            businessName: "St. Lawrence Market",
            address: "92 Front St E, Toronto",
            itemName: "Vendor Price Tag",
            clue: "Since 1803, this red-brick hall has fed the city. Find a stall where something fresh is always on display — and look for the little label that names its price."
        ),
        ScavengerItem(
            id: 5,
            businessName: "Toronto Public Library",
            address: "789 Yonge St, Toronto",
            itemName: "Date-Due Slip",
            clue: "Knowledge lives here, floor by floor. Find the place where books go to be borrowed — and look for the small paper that tells you when to bring it back."
        ),
        ScavengerItem(
            id: 6,
            businessName: "Ripley's Aquarium",
            address: "288 Bremner Blvd, Toronto",
            itemName: "Shark Fin Sticker",
            clue: "Beneath a pretend ocean in the heart of the city, something sharp cuts silently through the water. Find it — if you dare go under."
        ),
        ScavengerItem(
            id: 7,
            businessName: "CN Tower Gift Shop",
            address: "290 Bremner Blvd, Toronto",
            itemName: "Miniature CN Tower Keychain",
            clue: "It once touched the sky as the world's tallest. Now a tiny version of it fits in your pocket. Find the shop that sells the city in miniature."
        ),
        ScavengerItem(
            id: 8,
            businessName: "Courage My Love",
            address: "14 Kensington Ave, Toronto",
            itemName: "Vintage Pin Badge",
            clue: "In a neighbourhood that never quite decided what decade it lives in, a tiny piece of metal holds someone's old opinion. Dig through the past to find it."
        ),
        ScavengerItem(
            id: 9,
            businessName: "Casa Loma",
            address: "1 Austin Terrace, Toronto",
            itemName: "Knight's Shield Emblem",
            clue: "A castle in the middle of a city that never needed one. Wander its halls and find the coat of arms that guards a story nobody quite finished building."
        ),
        ScavengerItem(
            id: 10,
            businessName: "Balzac's Coffee",
            address: "55 Mill St, Toronto",
            itemName: "Coffee Loyalty Card",
            clue: "Cobblestones and red brick lead you to a cup of something bold. Find the café tucked inside history — and pick up the little card that rewards those who return."
        )
    ]
}
