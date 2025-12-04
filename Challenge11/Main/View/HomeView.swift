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
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @StateObject private var nav = routerService.shared
    
    var body: some View {
//        NavigationStack() {
            VStack {
                Text("\(presenter.focusDuration.formatted())")
                    .font(.system(size: 64))
                Text("\(presenter.breakDuration.formatted())")
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
                    
                    Button {
                        presenter.navigate(to: .adicionar)
                    } label: {
                        Image(systemName: "plus")
                    } .buttonStyle(.glassProminent)
                    
                }
            }
            
//        }
//        .navigationDestination(for: Route.self) { Route in
//            switch Route {
//            case .home:
//                ContentView(presenter: presenter)
//            case .adicionar:
//                AddDayView()
//            case .detail(_):
//                EmptyView()
//            case .historico:
//                EmptyView()
//            }
//        }
        .onReceive(timer) { input in
            print("View tick")
            presenter.timerTick()
            presenter.getActivity()
        }
        .onDisappear{
            timer.upstream.connect().cancel()
        }
        .onAppear {
            timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            presenter.viewDidLoad()
            presenter.getActivity()
        }
        
    }
}




#Preview {
    let interactor = HomeInteractor()
    let router = HomeRouter()
    let presenter = HomePresenter(interactor: interactor, router: router)
    ContentView(presenter: presenter)
        .navigationDestination(for: Route.self) { Route in
            switch Route {
            case .home:
                ContentView(presenter: presenter)
            case .adicionar:
                let addInteractor = AddDayInteractor()
                let addRouter = AddDayRouter()
                let addPresenter = AddDayPresenter(interactor: addInteractor, router: addRouter)
                AddDayView(presenter: addPresenter)
            case .detail(let String):
                EmptyView()
            case .historico:
                EmptyView()
            }
        }
    
}

