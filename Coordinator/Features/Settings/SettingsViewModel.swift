import Foundation

class SettingsViewModel {
    private weak var coordinator: SettingsCoordinator?
    
    init(coordinator: SettingsCoordinator) {
        self.coordinator = coordinator
    }
    
    func navigateToProfileAdvancedSettings() {
        coordinator?.navigateToProfileAdvancedSettings()
    }
} 