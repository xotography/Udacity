//
//  RequestSessionIDResponse.swift
//  OnTheMap
//
//  Created by Ariya Behjat on 20/03/2020.
//  Copyright © 2020 Ariya Behjat. All rights reserved.
//

import Foundation

struct RequestSessionIDResponse: Codable {
    let account: Account 
    let session: Session
}

struct Account: Codable {
    let isRegistered: Bool
    let key: String
    
    enum CodingKeys: String, CodingKey {
        case isRegistered = "registered"
        case key = "key"
    }
}

struct Session: Codable {
    let id: String
    let expiresAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case expiresAt = "expiration"
    }
}
