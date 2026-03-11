protocol AddDayRouterProtocol: AnyObject {
    
    var RouterService: RouterServiceProtocol { get }
    
    func pop()
}

protocol AddDayInteractorProtocol: AnyObject {
    var presenter: AddDayPresenterProtocol? { get set }
    
    var manager:DataManager { get }
    
    func criarRegistro(withName: String)
    
}

protocol AddDayPresenterProtocol: AnyObject {
    
    var interactor: AddDayInteractorProtocol { get set }
    var router: AddDayRouterProtocol { get set }
    
    func pop()
    func addDay(withName: String)
}

protocol AddDayViewProtocol {
    
}

//Lmao
