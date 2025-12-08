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
    let manager = DataManager.shared
    
    
    
    
    
    func criarRegistro() {
        activity?.timer.focusTimers.append(Duration.seconds(0))
        activity?.timer.relaxTimers.append(Duration.seconds(0))
    }
    
    func getActivity() -> Activity{
        if manager.activities.isEmpty {
            let novaAtividade = Activity(title: "Primeiro Pomodoro")
            manager.activities.append(novaAtividade)
        }
        activity = manager.activities.last
        presenter?.name = activity!.title
        print(activity as Any)
        return activity!
    }
    
    
    func atualizarRegistro() {
        
    }
    
    func salvarRegistro() {
        
    }
    
    func timerTick() {
        guard let atividade = activity else { return }
        guard let presenter = presenter else { return }
        guard atividade.timer.focusTimers.isEmpty == false else { return }
        guard atividade.timer.relaxTimers.isEmpty == false else { return }
        let lastIndex = atividade.timer.focusTimers.endIndex
        
        //Estado de foco
        if presenter.isOnBreak == false {
            atividade.timer.focusTimers[lastIndex - 1] += .seconds(1)
            atividade.timer.relaxTimers[lastIndex - 1] += ((atividade.timer.focusTimers[lastIndex - 1].components.seconds % 3) == 0 && atividade.timer.focusTimers[lastIndex - 1].components.seconds != 0) ? .seconds(1) : .zero
            print(manager.activities, manager.activities.last!.title, manager.activities.last!.timer.focusTimers, manager.activities.last!.timer.relaxTimers)
            presenter.focusDuration = atividade.timer.focusTimers[lastIndex - 1]
            presenter.breakDuration = atividade.timer.relaxTimers[lastIndex - 1]
            
        } else {
            //Estado de pausa
            presenter.breakDuration -= .seconds(1)
            print(presenter.breakDuration as Any)
        }
        
     
        
        
        
    }
        
}
