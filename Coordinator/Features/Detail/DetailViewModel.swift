import Foundation

class DetailViewModel {
    private weak var coordinator: HomeCoordinator?
    private let item: Item
    
    init(coordinator: HomeCoordinator, item: Item) {
        self.coordinator = coordinator
        self.item = item
    }
    
    func getItem() -> Item {
        return item
    }
} 