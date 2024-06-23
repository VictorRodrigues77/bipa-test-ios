//
//  TopRankingViewModel.swift
//  bipa-test-ios
//
//  Created by Victor Rodrigues on 22/06/24.
//

import Foundation

protocol TopRankingViewModelProtocol: AnyObject {
    var numberOfRowsInSection: Int { get }
    func cellForRowAt(at index: Int) -> TopRankingModel?
}

final class TopRankingViewModel: TopRankingViewModelProtocol {
    
    private var network: TopRankingService?
    private var nodes: [Node]?
    
    var onShowLoading: (() -> Void)?
    var onHideLoading: (() -> Void)?
    var onSuccessFetchNodes: (() -> Void)?
    var onFailureFetchNodes: ((Error) -> Void)?
    
    init(coordinator: CoordinatorProtocol?, network: TopRankingService) {
        self.network = network
    }
    
    func fetchNodes() {
        self.onShowLoading?()
        
        Task(priority: .background) {
            guard let result = await network?.getListOfNodes() else {
                self.onFailureFetchNodes?(HTTPError.unknown)
                return
            }
            switch result {
            case .success(let nodes):
                self.onHideLoading?()
                self.nodes = nodes
                self.onSuccessFetchNodes?()
            case .failure(let error):
                self.onHideLoading?()
                self.onFailureFetchNodes?(error)
            }
        }
    }
    
    var numberOfRowsInSection: Int {
        return nodes?.count ?? 0
    }
    
    func cellForRowAt(at index: Int) -> TopRankingModel? {
        guard let node = nodes?[index] else { return nil }
        return TopRankingModel(node: node)
    }
    
}
