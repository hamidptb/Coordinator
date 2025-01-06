import Foundation

class HybridViewModel {
    private weak var coordinator: SwiftUIFlowCoordinator?
    
    init(coordinator: SwiftUIFlowCoordinator) {
        self.coordinator = coordinator
    }
    
    func finish() {
        coordinator?.finish()
    }
} 