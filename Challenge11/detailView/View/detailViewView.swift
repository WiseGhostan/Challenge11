import SwiftUI

struct detailViewView: View, detailViewViewProtocol {
    
    var activity: Activity?
    var totalFocus: Int64 {
        let timers: [Duration] = activity?.timer.focusTimers ?? []
        var totalSeconds:Int64 = 0
        for d in timers {
            totalSeconds += d.components.seconds
        }
        return totalSeconds
    }
    var totalRelax: Int64 {
        let timers: [Duration] = activity?.timer.relaxTimers ?? []
        var totalSeconds:Int64 = 0
        for d in timers {
            totalSeconds += d.components.seconds
        }
        return totalSeconds
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Titulo: \(activity?.title ?? "")")
            if let date = activity?.date {
                Text("Data: \(date.formatted(date: .abbreviated, time: .shortened))")
            } else {
                Text("Data: —")
            }
            Text("Tempos de foco: \(activity?.timer.focusTimers.count ?? 0)")
            Text("Total foco: \(totalFocus)s")
            Text("Tempos de descanso: \(activity?.timer.relaxTimers.count ?? 0)")
            Text("Total descanso: \(totalRelax)s")
        }
        .padding()
    }
}

#Preview {
    detailViewView()
}
