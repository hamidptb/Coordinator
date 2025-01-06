import UIKit

class ModalCoordinator: Coordinator {
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = ModalViewModel(coordinator: self)
        let viewController = ModalViewController(viewModel: viewModel)
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func dismiss() {
        navigationController.dismiss(animated: true) { [weak self] in
            self?.finish()
        }
    }
} 