//
//  TopRankingEndpoint.swift
//  bipa-test-ios
//
//  Created by Victor Rodrigues on 22/06/24.
//

import Foundation

enum TopRankingEndpoint {
    case nodesRankingList
}

extension TopRankingEndpoint: Endpoint {
    var path: String {
        switch self {
        case .nodesRankingList:
            return "/api/v1/lightning/nodes/rankings/connectivity"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var header: [String : String]? {
        return nil
    }
    
    var body: [String : String]? {
        return nil
    }
}
