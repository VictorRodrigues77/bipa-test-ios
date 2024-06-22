//
//  Coordinator.swift
//  bipa-test-ios
//
//  Created by Victor Rodrigues on 22/06/24.
//

import UIKit

class Coordinator: BaseCoordinator, CoordinatorProtocol {
    
    private(set) var childCoordinators: [BaseCoordinator] = []
    // The reference is weak to prevent a retain cycle
    
    weak var navigationController: UINavigationController?
    private var topRankingFactory: TopRankingFactory
    
    init(topRankingFactory: TopRankingFactory) {
        self.topRankingFactory = topRankingFactory
    }
    
    func addChildCoordinator(_ coordinator: BaseCoordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeAllChildCoordinatorsWith<T>(type: T.Type) {
        childCoordinators = childCoordinators.filter { $0 is T  == false }
    }
    
    func removeAllChildCoordinators() {
        childCoordinators.removeAll()
    }
    
    func start(_ navigationController: UINavigationController) {
        let vc = topRankingFactory.makeController(coordinator: self)
        self.navigationController = navigationController
        navigationController.pushViewController(vc, animated: true)
    }
    
}
