//
//  TopRankingViewModel.swift
//  bipa-test-ios
//
//  Created by Victor Rodrigues on 22/06/24.
//

import Foundation

final class TopRankingViewModel {
    
    private var network: HTTPClient?
    
    init(coordinator: CoordinatorProtocol?, network: HTTPClient) {
        self.network = network
    }
    
}
