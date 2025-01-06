import Foundation

class ProfileDetailsViewModel {
    private weak var coordinator: ProfileCoordinator?
    
    init(coordinator: ProfileCoordinator) {
        self.coordinator = coordinator
    }
    
    func showProfileSettings() {
        coordinator?.showProfileSettings()
    }
} 