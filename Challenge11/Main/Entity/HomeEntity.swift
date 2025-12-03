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
    var focusTimers:[Duration] = []
    var relaxTimers:[Duration] = []
    
    @Relationship(inverse: \Activity.timer)
    var activity:Activity?
    
    init(){
        
    }
    
}

