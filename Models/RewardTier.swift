//
//  RewardTier.swift
//  iOSApp2
//
//  Created by Zubia Tahseen on 2026-06-08.
//

import Foundation

/// Defines the reward tiers earned based on how many scavenger items the user finds.
/// Each tier provides a user-facing message and an optional discount code.
enum RewardTier {
    case none
    case tenPercent
    case twentyPercent
    case grandPrize

    /// A human-readable message describing what the user earned at this tier.
    var message: String {
        switch self {
        case .none:
            return "Keep searching! Find 5 or more items to earn a reward."
        case .tenPercent:
            return "You earned a 10% discount code!"
        case .twentyPercent:
            return "You earned a 20% discount code!"
        case .grandPrize:
            return "You found everything! You're entered into the $5,000 grand prize draw!"
        }
    }

    /// The discount code string for this tier, or nil if no discount was earned.
    var discountCode: String? {
        switch self {
        case .none:       return nil
        case .tenPercent: return "HUNT10"
        case .twentyPercent, .grandPrize: return "HUNT20"
        }
    }
}
