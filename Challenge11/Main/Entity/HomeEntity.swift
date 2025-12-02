//
//  HomeEntity.swift
//  Challenge11
//
//  Created by Wise on 27/11/25.
//

import Foundation
import SwiftData

@Model
class focusRegister {
    
    @Attribute(.unique) var id:Int
    var title: String
    var date: Date = Date()
    var isDone: Bool
    var focusTimers:[Int] = []
    var relaxTimers:[Int] = []
    
    init(id: Int, title: String, isDone: Bool) {
        self.id = id
        self.title = title
        self.isDone = isDone
    }
    
}

