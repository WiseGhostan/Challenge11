import Foundation
import Combine

class AddDayInteractor: AddDayInteractorProtocol {
    
    weak var presenter: AddDayPresenterProtocol?
    
    let manager = DataManager.shared
    
    func criarRegistro(withName: String) {
        let novaAtividade = Activity(title: withName)
        manager.activities.append(novaAtividade)
    }
    
    
}

