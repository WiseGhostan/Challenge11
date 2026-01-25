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
    
    var body: some View {
        NavigationStack(path: $presenter.router.path) {
            VStack {
                Text("\(focusDuration.formatted())")
                        .onReceive(timer) { input in
                            focusDuration += Duration.seconds(1)
                        }
                        .font(.system(size: 64))
                Text("\(breakDuration.formatted())")
                        .onReceive(timer) { input in
                            breakDuration += ((focusDuration.components.seconds % 3) == 0 && focusDuration.components.seconds != 0) ? Duration.seconds(1) : Duration.seconds(0)
                        }
                        .font(.system(size: 32))
                    
                
                
                HStack{
                    Button {} label: {
                        Image(systemName: "pause.fill")
                    } .buttonStyle(.glass)
                
                    Button(action: {}) {
                        Image(systemName: "play.fill")
                    } .buttonStyle(.glassProminent)
                }
                
                
                .toolbar {
                    ToolbarItem() {
                        Button("+") {
                            presenter.router.navigate(to: .adicionar)
                        }
//                        NavigationLink(destination: Button("asd") {print(path)}) {
//                            Image(systemName: "plus")
//                        }
//                        .buttonStyle(.glassProminent)
                    }
                    
                }
            }
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
                        addView()
                    case .detail(let String):
                        EmptyView()
                    case .historico:
                        EmptyView()
                    }
        }
}

