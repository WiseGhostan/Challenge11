//
//  HomeRouter.swift
//  Challenge11
//
//  Created by Wise on 28/11/25.
//

import Foundation
import SwiftUI
import Combine

enum Route: Hashable, Codable {
    case home
    case historico
    case adicionar
    case detail(id: String)
}

protocol RouterServiceProtocol {
    
    var path: NavigationPath { get set }
    
    func navigate(to destination: Route)
    func pop()
    func popToRoot()
    
}


final class routerService: ObservableObject, RouterServiceProtocol {
    
    static let shared = {
        let instance = routerService()
        return instance
    }()
    
    @Published var path = NavigationPath()
    
    private init(){
        
    }
    
    func navigate(to destination: Route){
        path.append(destination)
    }
    
    func pop(){
        path.removeLast()
    }
    
    func popToRoot(){
        path.removeLast(path.count)
    }
    
}
