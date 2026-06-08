//
//  RewardTier.swift
//  iOSApp2
//
//  Created by Zubia Tahseen on 2026-06-08.
//

import Foundation

enum RewardTier {
    case none
    case tenPercent
    case twentyPercent
    case grandPrize

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

    var discountCode: String? {
        switch self {
        case .none:       return nil
        case .tenPercent: return "HUNT10"
        case .twentyPercent, .grandPrize: return "HUNT20"
        }
    }
}


