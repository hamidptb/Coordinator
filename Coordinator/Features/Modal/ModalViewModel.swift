import Foundation

class ModalViewModel {
    private weak var coordinator: ModalCoordinator?
    
    init(coordinator: ModalCoordinator) {
        self.coordinator = coordinator
    }
    
    func dismiss() {
        coordinator?.dismiss()
    }
} 