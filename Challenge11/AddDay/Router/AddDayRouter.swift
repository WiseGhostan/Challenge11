import Foundation
import SwiftUI

class AddDayRouter: AddDayRouterProtocol {
    
    let RouterService: any RouterServiceProtocol = routerService.shared
    
    func pop() {
        RouterService.pop()
    }
}
