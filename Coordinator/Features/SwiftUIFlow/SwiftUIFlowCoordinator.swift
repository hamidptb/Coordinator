import UIKit
import SwiftUI

class SwiftUIFlowCoordinator: Coordinator {
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showFirstView()
    }
    
    private func showFirstView() {
        let view = SwiftUIFirstView(coordinator: self)
        let hostingController = UIHostingController(rootView: view)
        hostingController.title = "SwiftUI Flow"
        navigationController.pushViewController(hostingController, animated: true)
    }
    
    func showSecondView() {
        let view = SwiftUISecondView(coordinator: self)
        let hostingController = UIHostingController(rootView: view)
        hostingController.title = "SwiftUI Second"
        navigationController.pushViewController(hostingController, animated: true)
    }
    
    func showHybridView() {
        let viewModel = HybridViewModel(coordinator: self)
        let viewController = HybridViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func finish() {
        navigationController.popToRootViewController(animated: true)
        parentCoordinator?.childCoordinators.removeAll { $0 === self }
    }
} 