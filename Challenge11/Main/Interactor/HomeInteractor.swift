//
//  HomeInteractor.swift
//  Challenge11
//
//  Created by Wise on 27/11/25.
//

import SwiftUI
import Foundation
import Combine

class HomeInteractor: HomeInteractorProtocol {
    //VIPER
    weak var presenter: HomePresenterProtoocol?
    
    var activity: Activity?
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    func criarRegistro(withName: String) {
        activity?.timer.focusTimers.append(Duration.seconds(0))
        activity?.timer.relaxTimers.append(Duration.seconds(0))
        
    }
    
    
    
    func atualizarRegistro() {
        
    }
    
    func salvarRegistro() {
        
    }
    
    func timerTick() {
        guard activity?.timer.focusTimers.isEmpty == false else { return }
        guard activity?.timer.relaxTimers.isEmpty == false else { return }
        
    }
        
}
