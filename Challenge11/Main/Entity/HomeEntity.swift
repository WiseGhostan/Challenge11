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
    var focusTimers:[Duration] = [Duration.seconds(0)]
    var relaxTimers:[Duration] = [Duration.seconds(0)]
    
    @Relationship(inverse: \Activity.timer)
    var activity:Activity?
    
    init(){
        
    }
    
}

