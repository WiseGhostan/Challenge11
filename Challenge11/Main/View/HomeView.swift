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
    @State var isPause:Bool = false
    
    @StateObject private var nav = routerService.shared
    
    var isAnimating:Bool = false
    
    var body: some View {
        //        NavigationStack() {
        
        VStack {
            Spacer()
            Text("\(presenter.focusDuration.formatted())")
                .font(.system(size: 64))
                .offset(x: isAnimating ? 200 : 0)
                .animation(.easeInOut)
            Text("\(presenter.breakDuration.formatted())")
                .font(.system(size: 32))
            
            
            
            HStack{
                Button {
                    
                } label: {
                    Image(systemName: "stop.fill")
                } .buttonStyle(.glass)
                
                Button {
                    if isPause {
                        isPause.toggle()
                        
                    } else {
                        isPause.toggle()
                    }
                    
                } label: {
                    if isPause {
                        Image(systemName: "play.fill")
                    }
                    else {
                        Image(systemName: "pause.fill")
                    }
                } .buttonStyle(.glassProminent)
            }
        }
        
        
        Divider()
        
        
        List{
            let atividades = presenter.interactor.manager.activities
            Text("Historico")
                .font(Font.title)
            ForEach(atividades) {atividade in
//                NavigationLink(value: atividade.self) {
//                    Text(atividade.title)
//                }
                
//                Button {
//                    presenter.navigate(to: .detail(activity: atividade))
//                } label: {
//                    Text(atividade.title)
//                } .buttonStyle(.plain)
                
                
                NavigationLink(atividade.title) {
                    detailViewView(activity: atividade)
                }
            }
            
        }
        
        .toolbar {
            
            Button {
                presenter.navigate(to: .adicionar)
            } label: {
                Image(systemName: "plus")
            } .buttonStyle(.glassProminent)
            
        } .onReceive(timer) { input in
            print("View tick")
            if !isPause {
                presenter.timerTick()
                presenter.getActivity()
            }
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
            case .detail(var Activity):
                EmptyView()
            case .historico:
                EmptyView()
            }
        }
    
}

