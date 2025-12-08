//
//  Protocols.swift
//  Challenge11
//
//  Created by Wise on 26/11/25.
//

import SwiftUI

protocol HomeViewProtoocol: AnyObject {
    
}

protocol HomePresenterProtoocol: AnyObject {
    var interactor: HomeInteractorProtocol { get set }
    var router: HomeRouterProtocol { get set }
    
    var isLoading:Bool { get set }
    var name:String { get set }
    
    func viewDidLoad()
    func timerTick()
}

protocol HomeInteractorProtocol: AnyObject {
    var activity: Activity? { get set }
    var manager:DataManager { get }
    
    func getActivity() -> Activity
    func criarRegistro()
    func atualizarRegistro()
    func salvarRegistro()
    func timerTick()
}

protocol HomeRouterProtocol: AnyObject {
    var RouterService: RouterServiceProtocol { get }
    func navigateToDetail(with activity: Activity)
    func navigateToAdd()
    func pop()
}

protocol HomeEntityProtocol: AnyObject {
    
}

