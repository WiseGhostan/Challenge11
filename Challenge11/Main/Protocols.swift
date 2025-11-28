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
}

protocol HomeInteractorProtocol: AnyObject {
    var registro:focusRegister? {get set}
    
    func criarRegistro()
    func atualizarRegistro()
    func salvarRegistro()
    
}

protocol HomeRouterProtocol: AnyObject {
    var path:NavigationPath {get set}
    func navigate(to destination: Route)
    func pop()
    func popToRoot()
}

protocol HomeEntityProtocol: AnyObject {
    
}
