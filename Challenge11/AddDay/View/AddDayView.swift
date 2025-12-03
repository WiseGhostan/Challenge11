import SwiftUI
import Foundation

struct AddDayView: View, AddDayViewProtocol {
    @State private var name: String = ""
    
    var body: some View {
        
        VStack {
            Text("Nome pomodoro")
                .frame(width: 250, alignment: .leading)
                .multilineTextAlignment(.leading)
                .font(.largeTitle)
                
            TextField("Nome da atividade", text: $name)
                .textFieldStyle(.automatic)
                .padding(.bottom, 20)
                .frame(width: 250)
            Button("Adicionar atividade pomodoro"){
                
            } .buttonStyle(.glassProminent)
        }
        
        
    }
}
    

