import Foundation

class NestedLevel3ViewModel {
    private weak var coordinator: NestedNavigationCoordinator?
    
    init(coordinator: NestedNavigationCoordinator) {
        self.coordinator = coordinator
    }
    
    func finish() {
        coordinator?.finish()
    }
} 