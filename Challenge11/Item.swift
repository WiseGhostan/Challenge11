//
//  Item.swift
//  Challenge11
//
//  Created by Wise on 25/11/25.
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
