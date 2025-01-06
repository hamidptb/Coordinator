import UIKit
import SwiftUI

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = HomeViewModel(coordinator: self)
        let viewController = HomeViewController(viewModel: viewModel)
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    // MARK: - Navigation Methods
    func showDetail(for item: Item) {
        let viewModel = DetailViewModel(coordinator: self, item: item)
        let viewController = DetailViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showNestedNavigation() {
        let nestedCoordinator = NestedNavigationCoordinator(navigationController: navigationController)
        nestedCoordinator.parentCoordinator = self
        addChildCoordinator(nestedCoordinator)
        nestedCoordinator.start()
    }
    
    func showSwiftUIFlow() {
        let swiftUICoordinator = SwiftUIFlowCoordinator(navigationController: navigationController)
        swiftUICoordinator.parentCoordinator = self
        addChildCoordinator(swiftUICoordinator)
        swiftUICoordinator.start()
    }
    
    func presentComplexModal() {
        let modalCoordinator = ComplexModalCoordinator(navigationController: UINavigationController())
        modalCoordinator.parentCoordinator = self
        addChildCoordinator(modalCoordinator)
        modalCoordinator.start()
        
        modalCoordinator.navigationController.modalPresentationStyle = .fullScreen
        navigationController.present(modalCoordinator.navigationController, animated: true)
    }
} 