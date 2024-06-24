//
//  TopRankingModel.swift
//  bipa-test-ios
//
//  Created by Victor Rodrigues on 22/06/24.
//

import Foundation

struct TopRankingModel: Equatable {
    let publicKey: String
    let alias: String
    let channels: String
    let capacity: String
    let firstSeen: String
    let updatedAt: String
    let city: String
    let country: String
    
    init(node: Node) {
        self.publicKey = "Public Key: \(node.publicKey)"
        self.alias = "Alias: \(node.alias)"
        self.channels = "Channels: \(node.channels)"
        self.capacity = "\(node.capacity / 100000000) BTC"
        
        let firstSeenUnix = Date(timeIntervalSince1970: TimeInterval(node.firstSeen))
        self.firstSeen = "First Seen: \(firstSeenUnix.formatted(date: .numeric, time: .standard))"
        
        let updatedAtUnix = Date(timeIntervalSince1970: TimeInterval(node.updatedAt))
        self.updatedAt = "Update at: \(updatedAtUnix.formatted(date: .numeric, time: .standard))"
        
        if let cityPtBr = node.city?.ptBR {
            self.city = "City: \(cityPtBr)"
        } else {
            if let cityEn = node.city?.en {
                self.city = "City: \(cityEn)"
            } else {
                self.city = "City: ???"
            }
        }
        
        if let countryPtBr = node.country?.ptBR {
            self.country = "Country: \(countryPtBr)"
        } else {
            if let countryEn = node.city?.en {
                self.country = "Country: \(countryEn)"
            } else {
                self.country = "Country: ???"
            }
        }
    }
    
    static func == (lhs: TopRankingModel, rhs: TopRankingModel) -> Bool {
        return lhs.publicKey == rhs.publicKey
    }
}
