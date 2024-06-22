//
//  BaseCoordinator.swift
//  bipa-test-ios
//
//  Created by Victor Rodrigues on 22/06/24.
//

import Foundation

protocol BaseCoordinator {
    func addChildCoordinator(_ coordinator: BaseCoordinator)
    func removeAllChildCoordinatorsWith<T>(type: T.Type)
    func removeAllChildCoordinators()
}
