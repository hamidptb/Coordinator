import Foundation

class NestedLevel1ViewModel {
    private weak var coordinator: NestedNavigationCoordinator?
    
    init(coordinator: NestedNavigationCoordinator) {
        self.coordinator = coordinator
    }
    
    func goToLevel2() {
        coordinator?.showLevel2()
    }
} 