import SwiftUI

struct SwiftUISecondView: View {
    weak var coordinator: SwiftUIFlowCoordinator?
    
    var body: some View {
        VStack(spacing: 20) {
            Text("SwiftUI Second View")
                .font(.largeTitle)
            
            Button("Go Back") {
                coordinator?.navigationController.popViewController(animated: true)
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
} 