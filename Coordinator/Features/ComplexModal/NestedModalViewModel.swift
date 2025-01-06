import Foundation

class NestedModalViewModel {
    private weak var coordinator: ComplexModalCoordinator?
    
    init(coordinator: ComplexModalCoordinator) {
        self.coordinator = coordinator
    }
    
    func dismiss() {
        coordinator?.dismiss()
    }
} 