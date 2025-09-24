//
//  Item.swift
//  Habit Streaker
//
//  Created by snzhrk on 13.09.2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
