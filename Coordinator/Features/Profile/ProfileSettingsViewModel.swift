import Foundation

class ProfileSettingsViewModel {
    private weak var coordinator: ProfileCoordinator?
    
    init(coordinator: ProfileCoordinator) {
        self.coordinator = coordinator
    }
    
    func showAdvancedSettings() {
        coordinator?.showProfileAdvancedSettings()
    }
} 