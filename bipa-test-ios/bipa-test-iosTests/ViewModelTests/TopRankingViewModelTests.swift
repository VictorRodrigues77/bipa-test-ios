//
//  TopRankingViewModelTests.swift
//  bipa-test-iosTests
//
//  Created by Victor Rodrigues on 23/06/24.
//

import XCTest
@testable import bipa_test_ios

final class TopRankingViewModelTests: XCTestCase {

    private var viewModel: TopRankingViewModel?

    override func setUp() {
        super.setUp()
        
        viewModel = TopRankingViewModel(
            coordinator: Coordinator(topRankingFactory: .init()),
            network: TopRankingServiceImplementation()
        )
    }
    
    func test_fetchTypes() {
        let value = Mock.nodes
        
        viewModel?.fetchNodes()
        
        XCTAssertEqual(viewModel?.nodes, value)
    }
    
    func test_fetchTypes_nil() {
        let value: [Node]? = nil
        
        XCTAssertEqual(viewModel?.nodes, value)
    }
    
    func test_numberOfRowsInSection() {
        let value = Mock.nodes.count
        
        viewModel?.fetchNodes()
        
        XCTAssertEqual(viewModel?.numberOfRowsInSection, value)
    }
    
    func test_numberOfRowsInSection_nil() {
        let value = 0
        
        XCTAssertEqual(viewModel?.numberOfRowsInSection, value)
    }
    
    func test_cellForRowAt() {
        let value = TopRankingModel(node: Mock.nodes.first!)
        
        viewModel?.fetchNodes()
        
        XCTAssertEqual(viewModel?.cellForRowAt(at: 0), value)
    }
    
    func test_cellForRowAt_nil() {
        let value: TopRankingModel? = nil
        
        XCTAssertEqual(viewModel?.cellForRowAt(at: 0), value)
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

}

extension TopRankingViewModelTests {
    enum Mock {
        static let nodes = [
            Node(
                publicKey: "0242a4ae0c5bef18048fbecf995094b74bfb0f7391418d71ed394784373f41e4f3",
                alias: "CoinGate",
                channels: 1305,
                capacity: 2173432805,
                firstSeen: 1528159480,
                updatedAt: 1719189856,
                city: .init(
                    de: "Frankfurt am Main",
                    en: "Frankfurt am Main",
                    es: "Francfort",
                    fr: "Francfort-sur-le-Main",
                    ja: "フランクフルト・アム・マイン",
                    ptBR: "Frankfurt am Main",
                    ru: "Франкфурт",
                    zhCN: "法兰克福"
                ),
                country: .init(
                    de: "Deutschland",
                    en: "Germany",
                    es: "Alemania",
                    fr: "Allemagne",
                    ja: "ドイツ連邦共和国",
                    ptBR: "Alemanha",
                    ru: "Германия",
                    zhCN: "德国"
                ),
                isoCode: "DE",
                subdivision: "{\"de\":\"Hessen\",\"en\":\"Hesse\",\"es\":\"Hessen\",\"fr\":\"Hesse\",\"ru\":\"Гессен\"}"
            ),
            Node(
                publicKey: "0242a4ae0c5bef18048fbecf995094b74bfb0f7391418d71ed394784373f41e4f3",
                alias: "CoinGate",
                channels: 1305,
                capacity: 2173432805,
                firstSeen: 1528159480,
                updatedAt: 1719189856,
                city: .init(
                    de: "Frankfurt am Main",
                    en: "Frankfurt am Main",
                    es: "Francfort",
                    fr: "Francfort-sur-le-Main",
                    ja: "フランクフルト・アム・マイン",
                    ptBR: "Frankfurt am Main",
                    ru: "Франкфурт",
                    zhCN: "法兰克福"
                ),
                country: .init(
                    de: "Deutschland",
                    en: "Germany",
                    es: "Alemania",
                    fr: "Allemagne",
                    ja: "ドイツ連邦共和国",
                    ptBR: "Alemanha",
                    ru: "Германия",
                    zhCN: "德国"
                ),
                isoCode: "DE",
                subdivision: "{\"de\":\"Hessen\",\"en\":\"Hesse\",\"es\":\"Hessen\",\"fr\":\"Hesse\",\"ru\":\"Гессен\"}"
            )
        ]
    }
}
 
