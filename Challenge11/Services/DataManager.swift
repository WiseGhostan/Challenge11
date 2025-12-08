//
//  DataManager.swift
//  Challenge11
//
//  Created by Wise on 03/12/25.
//

import Foundation
import Combine

final class DataManager: ObservableObject {
    
    
    static let shared = {
        let instance = DataManager()
        return instance
    }()
    @Published var activities: [Activity] = []
    
    
    
    init() {
        
    }
}
