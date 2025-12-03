//
//  HomePresenter.swift
//  Challenge11
//
//  Created by Wise on 27/11/25.
//

import Foundation
import Combine
import SwiftUI

class HomePresenter: ObservableObject, HomePresenterProtoocol {
    //VIPER
    var interactor: HomeInteractorProtocol
    var router: HomeRouterProtocol
    
    @Published var isLoading: Bool = true
    
    
    
    func navigate(to: Route){
        switch to {
        case .adicionar:
            router.navigateToAdd()
        case .detail(let string):
            router.navigateToDetail(with: string)
        case .home:
            print("Home")
        case .historico:
            print("Historico")
        @unknown default:
            break
        }
    }
    
    init(interactor: HomeInteractorProtocol, router: HomeRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        isLoading = false
    }
}


