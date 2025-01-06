import Foundation

class NestedLevel2ViewModel {
    private weak var coordinator: NestedNavigationCoordinator?
    
    init(coordinator: NestedNavigationCoordinator) {
        self.coordinator = coordinator
    }
    
    func goToLevel3() {
        coordinator?.showLevel3()
    }
} 