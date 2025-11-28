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

final class HomeRouter: ObservableObject, HomeRouterProtocol {
    
    @Published var path = NavigationPath()
    
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
