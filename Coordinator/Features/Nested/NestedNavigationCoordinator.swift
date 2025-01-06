import UIKit

class NestedNavigationCoordinator: Coordinator {
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = NestedLevel1ViewModel(coordinator: self)
        let viewController = NestedLevel1ViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showLevel2() {
        let viewModel = NestedLevel2ViewModel(coordinator: self)
        let viewController = NestedLevel2ViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showLevel3() {
        let viewModel = NestedLevel3ViewModel(coordinator: self)
        let viewController = NestedLevel3ViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func finish() {
        navigationController.popToRootViewController(animated: true)
        parentCoordinator?.childCoordinators.removeAll { $0 === self }
    }
} 