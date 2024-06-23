//
//  TopRankingFactory.swift
//  bipa-test-ios
//
//  Created by Victor Rodrigues on 22/06/24.
//

import Foundation

protocol TopRankingFactoryProtocol: AnyObject {
    var network: TopRankingService { get }
    func makeController(coordinator: Coordinator) -> TopRankingController
    func makeViewModel(coordinator: CoordinatorProtocol) -> TopRankingViewModel
}

class TopRankingFactory: TopRankingFactoryProtocol {
    var network: TopRankingService = TopRankingServiceImplementation()
    
    func makeController(coordinator: Coordinator) -> TopRankingController {
        let viewModel = makeViewModel(coordinator: coordinator)
        let controller = TopRankingController(coordinator: coordinator, viewModel: viewModel)
        return controller
    }
    
    func makeViewModel(coordinator: CoordinatorProtocol) -> TopRankingViewModel {
        let viewModel = TopRankingViewModel(coordinator: coordinator, network: network)
        return viewModel
    }
    
    func makeInitialCoordinator() -> Coordinator {
        let coordinator = Coordinator(topRankingFactory: self)
        return coordinator
    }
}
