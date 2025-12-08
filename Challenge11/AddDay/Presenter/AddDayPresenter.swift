import Foundation
import Combine

class AddDayPresenter: ObservableObject, AddDayPresenterProtocol {
    
    var interactor:AddDayInteractorProtocol
    var router:AddDayRouterProtocol

    init(interactor: AddDayInteractorProtocol, router: AddDayRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func addDay(withName: String){
        interactor.criarRegistro(withName: withName)
    }
    
    func pop() {
        router.pop()
    }
    
}
