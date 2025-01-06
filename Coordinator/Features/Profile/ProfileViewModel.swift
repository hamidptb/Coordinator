import Foundation

class ProfileViewModel {
    private weak var coordinator: ProfileCoordinator?
    
    init(coordinator: ProfileCoordinator) {
        self.coordinator = coordinator
    }
    
    func showProfileDetails() {
        coordinator?.showProfileDetails()
    }
} 