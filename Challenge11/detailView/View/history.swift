//
//  history.swift
//  Challenge11
//
//  Created by Wise on 05/12/25.
//

import SwiftUI

struct history: View {
    
    @State var manager = DataManager.shared
    
    var body: some View {
        List{
            let atividades = manager.activities
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
    }
}

#Preview {
    history()
}
