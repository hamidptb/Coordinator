import UIKit

class ComplexModalCoordinator: Coordinator {
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = ComplexModalViewModel(coordinator: self)
        let viewController = ComplexModalViewController(viewModel: viewModel)
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func showNestedModal() {
        let viewModel = NestedModalViewModel(coordinator: self)
        let viewController = NestedModalViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func dismiss() {
        navigationController.dismiss(animated: true) { [weak self] in
            self?.finish()
        }
    }
} 