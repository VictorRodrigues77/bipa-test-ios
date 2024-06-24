//
//  TopRankingTests.swift
//  bipa-test-iosTests
//
//  Created by Victor Rodrigues on 22/06/24.
//

import XCTest
@testable import bipa_test_ios

class TopRankingTests: XCTestCase {

    func testTopRankingServiceMock() async {
        let serviceMock = TopRankingMock()
        let failingResult = await serviceMock.getListOfNodes()
        
        switch failingResult {
        case .success(let nodes):
            XCTAssertEqual(nodes?.count != 0, true)
        case .failure:
            XCTFail("The request should not fail")
        }
    }
    
}

final class TopRankingMock: Mockable, TopRankingService {
    func getListOfNodes() async -> Result<[Node]?, HTTPError> {
        return .success(loadJSON(filename: "top_ranking_nodes", type: [Node]?.self))
    }
}
