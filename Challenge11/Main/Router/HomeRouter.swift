//
//  HomeRouter.swift
//  Challenge11
//
//  Created by Wise on 01/12/25.
//

class HomeRouter: HomeRouterProtocol {
    
    let RouterService: any RouterServiceProtocol = routerService.shared
    
    func navigateToDetail(with atividade: Activity) {
        RouterService.navigate(to: .detail(activity: atividade))
    }
    
    func navigateToAdd() {
        RouterService.navigate(to: .adicionar)
    }
    
    func pop() {
        RouterService.pop()
    }
}
