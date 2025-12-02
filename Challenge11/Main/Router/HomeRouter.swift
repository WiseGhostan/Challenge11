//
//  HomeRouter.swift
//  Challenge11
//
//  Created by Wise on 01/12/25.
//

class HomeRouter: HomeRouterProtocol {
    
    let RouterService: any RouterServiceProtocol = routerService.shared
    
    func navigateToDetail(with id: String) {
        RouterService.navigate(to: .detail(id: id))
    }
    
    func navigateToAdd() {
        RouterService.navigate(to: .adicionar)
    }
    
    func pop() {
        RouterService.pop()
    }
}
