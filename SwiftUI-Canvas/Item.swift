//
//  Item.swift
//  SwiftUI-Canvas
//
//  Created by Pramod Kumar on 18/12/25.
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
