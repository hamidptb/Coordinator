import Foundation

class ComplexModalViewModel {
    private weak var coordinator: ComplexModalCoordinator?
    
    init(coordinator: ComplexModalCoordinator) {
        self.coordinator = coordinator
    }
    
    func showNestedModal() {
        coordinator?.showNestedModal()
    }
    
    func dismiss() {
        coordinator?.dismiss()
    }
} 