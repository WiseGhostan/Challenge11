//
//  Challenge11App.swift
//  Challenge11
//
//  Created by Wise on 25/11/25.
//

import SwiftUI
import SwiftData

@main
struct Challenge11App: App {
    
    //Config SwiftData
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            focusRegister.self,
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    @StateObject private var nav = routerService.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $nav.path) {
                let interactor = HomeInteractor()
                let router = HomeRouter()
                let presenter = HomePresenter(interactor: interactor, router: router)
                ContentView(presenter: presenter)
                
                    .navigationDestination(for: Route.self) { Route in
                        switch Route {
                        case .home:
                            ContentView(presenter: presenter)
                        case .adicionar:
                            addView()
                        case .detail(let String):
                            EmptyView()
                        case .historico:
                            EmptyView()
                        }
                    }
                
            }
        }
        
        .modelContainer(sharedModelContainer)
    }
}
