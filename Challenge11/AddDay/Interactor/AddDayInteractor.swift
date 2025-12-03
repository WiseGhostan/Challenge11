import Foundation

class AddDayInteractor: AddDayInteractorProtocol {
    
    var activities:[Activity] = []
    
    func criarRegistro(withName: String) {
        let novaAtividade = Activity(title: withName)
        activities.append(novaAtividade)
    }
}

