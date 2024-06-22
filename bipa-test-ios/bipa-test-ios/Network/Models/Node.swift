//
//  Node.swift
//  bipa-test-ios
//
//  Created by Victor Rodrigues on 22/06/24.
//

import Foundation

struct Node: Codable {
    let publicKey, alias: String
    let channels, capacity, firstSeen, updatedAt: Int
    let city: City?
    let country: Country?
    let isoCode, subdivision: String?
    
    enum CodingKeys: String, CodingKey {
        case publicKey, alias, channels, capacity, firstSeen, updatedAt, city, country
        case isoCode = "iso_code"
        case subdivision
    }
    
    struct City: Codable {
        let de: String?
        let en: String
        let es, fr, ja, ptBR: String?
        let ru, zhCN: String?

        enum CodingKeys: String, CodingKey {
            case de, en, es, fr, ja
            case ptBR = "pt-BR"
            case ru
            case zhCN = "zh-CN"
        }
    }

    
    struct Country: Codable {
        let de: String?
        let en: String
        let es, fr, ja, ptBR: String?
        let ru, zhCN: String?

        enum CodingKeys: String, CodingKey {
            case de, en, es, fr, ja
            case ptBR = "pt-BR"
            case ru
            case zhCN = "zh-CN"
        }
    }

}
