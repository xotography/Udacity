//
//  UserInfoRequest.swift
//  OnTheMap
//
//  Created by Ariya Behjat on 30/03/2020.
//  Copyright © 2020 Ariya Behjat. All rights reserved.
//

import Foundation

struct UserInfoRequest: Codable {
    let lastName: String
    let firstName: String
    
    enum CodingKeys: String, CodingKey {
        case lastName = "last_name"
        case firstName = "first_name"
    }
}
