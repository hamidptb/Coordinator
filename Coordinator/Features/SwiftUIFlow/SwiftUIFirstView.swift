import SwiftUI

struct SwiftUIFirstView: View {
    weak var coordinator: SwiftUIFlowCoordinator?
    
    var body: some View {
        VStack(spacing: 20) {
            Text("SwiftUI First View")
                .font(.largeTitle)
            
            Button("Go to Second View") {
                coordinator?.showSecondView()
            }
            .buttonStyle(.borderedProminent)
            
            Button("Show Hybrid View") {
                coordinator?.showHybridView()
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
} 