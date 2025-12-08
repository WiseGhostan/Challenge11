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
    
    
    
    init(interactor: HomeInteractorProtocol, router: HomeRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        isLoading = false
    }
}


