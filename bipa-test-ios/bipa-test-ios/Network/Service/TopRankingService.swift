//
//  TopRankingService.swift
//  bipa-test-ios
//
//  Created by Victor Rodrigues on 22/06/24.
//

import Foundation

protocol TopRankingService {
    func getListOfNodes() async -> Result<[Node]?, HTTPError>
}

struct TopRankingServiceImplementation: HTTPClient, TopRankingService {
    func getListOfNodes() async -> Result<[Node]?, HTTPError> {
        return await sendRequest(endpoint: TopRankingEndpoint.nodesRankingList, responseModel: [Node]?.self)
    }
}
