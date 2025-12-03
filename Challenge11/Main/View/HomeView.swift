//
//  ContentView.swift
//  Challenge11
//
//  Created by Wise on 25/11/25.
//

import SwiftUI
import SwiftData
import Combine

struct ContentView: View {
    // VIper
    @StateObject var presenter:HomePresenter
    //@EnvironmentObject private var router:HomeRouter
    //@State private var path = NavigationPath()
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var focusDuration = Duration.seconds(0)
    @State private var breakDuration = Duration.seconds(0)
    
    @StateObject private var nav = routerService.shared
    
    var body: some View {
        NavigationStack() {
            VStack {
                Text("\(focusDuration.formatted())")
                    .font(.system(size: 64))
                Text("\(breakDuration.formatted())")
                    .font(.system(size: 32))
                
                
                
                HStack{
                    Button {} label: {
                        Image(systemName: "pause.fill")
                    } .buttonStyle(.glass)
                    
                    Button(action: {}) {
                        Image(systemName: "play.fill")
                    } .buttonStyle(.glassProminent)
                }
                
                Divider()
                
                .toolbar {
                    
                    Button("+") {
                        presenter.navigate(to: .adicionar)
                    }
                    
                }
            }
            
        }
        .navigationDestination(for: Route.self) { Route in
            switch Route {
            case .home:
                ContentView(presenter: presenter)
            case .adicionar:
                AddDayView()
            case .detail(_):
                EmptyView()
            case .historico:
                EmptyView()
            }
        }
        .onReceive(timer) { input in
            
            focusDuration += Duration.seconds(1)
            breakDuration += ((focusDuration.components.seconds % 3) == 0 && focusDuration.components.seconds != 0) ? Duration.seconds(1) : Duration.seconds(0)
        }
        
        .onAppear {
            presenter.viewDidLoad()
        }
        
    }
}




#Preview {
    let interactor = HomeInteractor()
    let router = HomeRouter()
    let presenter = HomePresenter(interactor: interactor, router: router)
    ContentView(presenter: presenter)
        .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .home:
                        EmptyView()
                    case .adicionar:
                        AddDayView()
                    case .detail(let String):
                        EmptyView()
                    case .historico:
                        EmptyView()
                    }
        }
}

