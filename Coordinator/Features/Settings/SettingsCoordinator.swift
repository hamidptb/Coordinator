import UIKit

class SettingsCoordinator: Coordinator {
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    // Reference to the profile coordinator for deep linking
    private weak var profileCoordinator: ProfileCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = SettingsViewModel(coordinator: self)
        let viewController = SettingsViewController(viewModel: viewModel)
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func setProfileCoordinator(_ coordinator: ProfileCoordinator) {
        profileCoordinator = coordinator
    }
    
    func navigateToProfileAdvancedSettings() {
        // Switch to profile tab and navigate to advanced settings
        if let tabBarController = navigationController.tabBarController {
            // Assuming Profile is the second tab (index 1)
            tabBarController.selectedIndex = 1
            profileCoordinator?.navigateToAdvancedSettings()
        }
    }
} 