import Foundation

class HomeViewModel {
    private weak var coordinator: HomeCoordinator?
    
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }
    
    func showDetail(item: Item) {
        coordinator?.showDetail(for: item)
    }
    
    func showNestedNavigation() {
        coordinator?.showNestedNavigation()
    }
    
    func showSwiftUIFlow() {
        coordinator?.showSwiftUIFlow()
    }
    
    func showComplexModal() {
        coordinator?.presentComplexModal()
    }
} 