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
    
    @Published var name: String = ""
    
    @Published var focusDuration:Duration = Duration.seconds(1000)
    @Published var breakDuration:Duration = Duration.seconds(1000)
    
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
    
    func getActivity() {
        guard let activity = interactor.activity else { return }
        
        let lastIndex = activity.timer.focusTimers.endIndex
        focusDuration = activity.timer.focusTimers[lastIndex - 1]
        breakDuration = activity.timer.relaxTimers[lastIndex - 1]
    }
    
    func timerTick() {
        interactor.timerTick()
        guard let activity = interactor.activity else { return }
        let lastIndex = activity.timer.focusTimers.endIndex
        focusDuration = activity.timer.focusTimers[lastIndex - 1]
        breakDuration = activity.timer.relaxTimers[lastIndex - 1]
    }
    
    
    func viewDidLoad() {
        let _ = interactor.getActivity()
        isLoading = false
        
    }
}


