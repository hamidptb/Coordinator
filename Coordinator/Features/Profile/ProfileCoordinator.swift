import UIKit

class ProfileCoordinator: Coordinator {
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = ProfileViewModel(coordinator: self)
        let viewController = ProfileViewController(viewModel: viewModel)
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func showProfileDetails() {
        let viewModel = ProfileDetailsViewModel(coordinator: self)
        let viewController = ProfileDetailsViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showProfileSettings() {
        let viewModel = ProfileSettingsViewModel(coordinator: self)
        let viewController = ProfileSettingsViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showProfileAdvancedSettings() {
        let viewModel = ProfileAdvancedSettingsViewModel(coordinator: self)
        let viewController = ProfileAdvancedSettingsViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    // Method to directly navigate to advanced settings (for deep linking)
    func navigateToAdvancedSettings() {
        showProfileDetails()
        showProfileSettings()
        showProfileAdvancedSettings()
    }
} 