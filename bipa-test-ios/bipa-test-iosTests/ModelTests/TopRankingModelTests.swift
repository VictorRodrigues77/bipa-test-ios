//
//  TopRankingModelTests.swift
//  bipa-test-iosTests
//
//  Created by Victor Rodrigues on 23/06/24.
//

import XCTest
@testable import bipa_test_ios

final class TopRankingModelTests: XCTestCase {
    
    func nodeAllEntries() throws {
        let node = Node(
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
        
        let model = TopRankingModel(node: node)
        XCTAssertEqual(model.publicKey, "Public Key: \(node.publicKey)")
        XCTAssertEqual(model.alias, "Alias: \(node.alias)")
        XCTAssertEqual(model.channels, "Channels: \(node.channels)")
        XCTAssertEqual(model.capacity, "\(node.capacity / 100000000) BTC")
        
        let firstSeenUnix = Date(timeIntervalSince1970: TimeInterval(node.firstSeen))
        XCTAssertEqual(model.firstSeen, "First Seen: \(firstSeenUnix.formatted(date: .numeric, time: .standard))")
        
        let updatedAtUnix = Date(timeIntervalSince1970: TimeInterval(node.updatedAt))
        XCTAssertEqual(model.updatedAt, "Update at: \(updatedAtUnix.formatted(date: .numeric, time: .standard))")
        
        XCTAssertEqual(model.city, "City: \(String(describing: node.city?.ptBR))")
        XCTAssertEqual(model.country, "Country: \(String(describing: node.country?.ptBR))")
    }
    
    func nodeNoCityPtBr() {
        let node = Node(
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
                ptBR: nil,
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
        
        let model = TopRankingModel(node: node)
        XCTAssertEqual(model.publicKey, "Public Key: \(node.publicKey)")
        XCTAssertEqual(model.alias, "Alias: \(node.alias)")
        XCTAssertEqual(model.channels, "Channels: \(node.channels)")
        XCTAssertEqual(model.capacity, "\(node.capacity / 100000000) BTC")
        
        let firstSeenUnix = Date(timeIntervalSince1970: TimeInterval(node.firstSeen))
        XCTAssertEqual(model.firstSeen, "First Seen: \(firstSeenUnix.formatted(date: .numeric, time: .standard))")
        
        let updatedAtUnix = Date(timeIntervalSince1970: TimeInterval(node.updatedAt))
        XCTAssertEqual(model.updatedAt, "Update at: \(updatedAtUnix.formatted(date: .numeric, time: .standard))")
        
        XCTAssertEqual(model.city, "City: \(String(describing: node.city?.en))")
        XCTAssertEqual(model.country, "Country: \(String(describing: node.country?.ptBR))")
    }
    
    func nodeNoCity() {
        let node = Node(
            publicKey: "0242a4ae0c5bef18048fbecf995094b74bfb0f7391418d71ed394784373f41e4f3",
            alias: "CoinGate",
            channels: 1305,
            capacity: 2173432805,
            firstSeen: 1528159480,
            updatedAt: 1719189856,
            city: nil,
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
        
        let model = TopRankingModel(node: node)
        XCTAssertEqual(model.publicKey, "Public Key: \(node.publicKey)")
        XCTAssertEqual(model.alias, "Alias: \(node.alias)")
        XCTAssertEqual(model.channels, "Channels: \(node.channels)")
        XCTAssertEqual(model.capacity, "\(node.capacity / 100000000) BTC")
        
        let firstSeenUnix = Date(timeIntervalSince1970: TimeInterval(node.firstSeen))
        XCTAssertEqual(model.firstSeen, "First Seen: \(firstSeenUnix.formatted(date: .numeric, time: .standard))")
        
        let updatedAtUnix = Date(timeIntervalSince1970: TimeInterval(node.updatedAt))
        XCTAssertEqual(model.updatedAt, "Update at: \(updatedAtUnix.formatted(date: .numeric, time: .standard))")
        
        XCTAssertEqual(model.city, "City: ???")
        XCTAssertEqual(model.country, "Country: \(String(describing: node.country?.ptBR))")
    }
    
    func nodeNoCountryPtBr() {
        let node = Node(
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
                ptBR: nil,
                ru: "Германия",
                zhCN: "德国"
            ),
            isoCode: "DE",
            subdivision: "{\"de\":\"Hessen\",\"en\":\"Hesse\",\"es\":\"Hessen\",\"fr\":\"Hesse\",\"ru\":\"Гессен\"}"
        )
        
        let model = TopRankingModel(node: node)
        XCTAssertEqual(model.publicKey, "Public Key: \(node.publicKey)")
        XCTAssertEqual(model.alias, "Alias: \(node.alias)")
        XCTAssertEqual(model.channels, "Channels: \(node.channels)")
        XCTAssertEqual(model.capacity, "\(node.capacity / 100000000) BTC")
        
        let firstSeenUnix = Date(timeIntervalSince1970: TimeInterval(node.firstSeen))
        XCTAssertEqual(model.firstSeen, "First Seen: \(firstSeenUnix.formatted(date: .numeric, time: .standard))")
        
        let updatedAtUnix = Date(timeIntervalSince1970: TimeInterval(node.updatedAt))
        XCTAssertEqual(model.updatedAt, "Update at: \(updatedAtUnix.formatted(date: .numeric, time: .standard))")
        
        XCTAssertEqual(model.city, "City: \(String(describing: node.city?.en))")
        XCTAssertEqual(model.country, "Country: \(String(describing: node.country?.en))")
    }
    
    func nodeNoCountry() {
        let node = Node(
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
            country: nil,
            isoCode: "DE",
            subdivision: "{\"de\":\"Hessen\",\"en\":\"Hesse\",\"es\":\"Hessen\",\"fr\":\"Hesse\",\"ru\":\"Гессен\"}"
        )
        
        let model = TopRankingModel(node: node)
        XCTAssertEqual(model.publicKey, "Public Key: \(node.publicKey)")
        XCTAssertEqual(model.alias, "Alias: \(node.alias)")
        XCTAssertEqual(model.channels, "Channels: \(node.channels)")
        XCTAssertEqual(model.capacity, "\(node.capacity / 100000000) BTC")
        
        let firstSeenUnix = Date(timeIntervalSince1970: TimeInterval(node.firstSeen))
        XCTAssertEqual(model.firstSeen, "First Seen: \(firstSeenUnix.formatted(date: .numeric, time: .standard))")
        
        let updatedAtUnix = Date(timeIntervalSince1970: TimeInterval(node.updatedAt))
        XCTAssertEqual(model.updatedAt, "Update at: \(updatedAtUnix.formatted(date: .numeric, time: .standard))")
        
        XCTAssertEqual(model.city, "City: \(String(describing: node.city?.ptBR))")
        XCTAssertEqual(model.country, "Country: \(String(describing: node.country?.ptBR))")
    }

}
