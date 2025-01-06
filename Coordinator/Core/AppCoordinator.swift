import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    private var tabBarController: UITabBarController
    private var window: UIWindow?
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.tabBarController = UITabBarController()
        self.window = window
    }
    
    func start() {
        // Setup tab bar
        let homeCoordinator = HomeCoordinator(navigationController: UINavigationController())
        let profileCoordinator = ProfileCoordinator(navigationController: UINavigationController())
        let settingsCoordinator = SettingsCoordinator(navigationController: UINavigationController())
        
        // Store coordinators
        addChildCoordinator(homeCoordinator)
        addChildCoordinator(profileCoordinator)
        addChildCoordinator(settingsCoordinator)
        
        // Start each coordinator
        homeCoordinator.start()
        profileCoordinator.start()
        settingsCoordinator.start()
        
        // Setup tab bar items
        homeCoordinator.navigationController.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        profileCoordinator.navigationController.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )
        
        settingsCoordinator.navigationController.tabBarItem = UITabBarItem(
            title: "Settings",
            image: UIImage(systemName: "gear"),
            selectedImage: UIImage(systemName: "gear")
        )
        
        // Set view controllers
        tabBarController.setViewControllers([
            homeCoordinator.navigationController,
            profileCoordinator.navigationController,
            settingsCoordinator.navigationController
        ], animated: false)
        
        // Set tab bar as root view controller directly in window
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        settingsCoordinator.setProfileCoordinator(profileCoordinator)
    }
} 