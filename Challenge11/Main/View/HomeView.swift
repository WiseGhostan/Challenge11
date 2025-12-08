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

    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var isOnBreak:Bool = false
    @State private var isPaused:Bool = true
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(presenter.focusDuration.formatted())")
                    .font(.system(size: isOnBreak ? 32 : 64))
                    .offset(y: isOnBreak ? 76 : 0)
                    .foregroundStyle(isOnBreak ? .gray : .purple)
            
                
                
            Text("\(presenter.breakDuration.formatted())")
                .font(.system(size: isOnBreak ? 64 : 32))
                .offset(y: isOnBreak ? -38 : 0)
                .foregroundStyle(isOnBreak ? .green : .blue)
            
            
            
            HStack{
//                Button {
//                    withAnimation {
//                        
//                    }
//                } label: {
//                    Image(systemName: "stop.fill")
//                } .buttonStyle(.glass)
                
                Button {
                    withAnimation {
                        if isPaused {
                            isPaused.toggle()
                            presenter.changeState() //seta para falso
                        } else if !isOnBreak {
                            isOnBreak.toggle()
                            presenter.changeState() //Seta para True
                        } else {
                            isOnBreak.toggle()
                            isPaused.toggle()
                            presenter.newTimer()
                        }
                    }
                } label: {
                    if isPaused {
                        Image(systemName: "play.fill")
                    }
                    else if !isOnBreak {
                        Image(systemName: "pause.fill")
                    }
                    else {
                        Image(systemName: "memories")
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
            if !isPaused{
                presenter.timerTick()
            }
            
        }
        .onDisappear{
            timer.upstream.connect().cancel()
        }
        .onAppear {
            timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            presenter.viewDidLoad()
        }
        .navigationTitle(presenter.name)
        
        
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
            case .detail(var Activity):
                EmptyView()
            case .historico:
                EmptyView()
            }
        }
    
}

