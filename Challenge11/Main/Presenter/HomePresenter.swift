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
    @Published var isOnBreak: Bool = true
    
    @Published var name: String = ""
    
    @Published var focusDuration:Duration = Duration.seconds(0)
    @Published var breakDuration:Duration = Duration.seconds(0)
    
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
        self.interactor.presenter = self
    }
    
    func newTimer() {
        interactor.criarRegistro()
        guard let activity = interactor.activity else { return }
        let lastIndex = activity.timer.focusTimers.endIndex
        focusDuration = activity.timer.focusTimers[lastIndex - 1]
        breakDuration = activity.timer.relaxTimers[lastIndex - 1]
    }
    
    func changeState() {
        isOnBreak.toggle()
    }
    
    func timerTick() {
        interactor.timerTick()
        print(breakDuration)
    }
    
    
    func viewDidLoad() {
        let _ = interactor.getActivity()
        isLoading = false
    }
}


