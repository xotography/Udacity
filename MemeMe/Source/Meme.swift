//
//  Meme.swift
//  Meme
//
//  Created by Ariya Behjat on 18/02/2020.
//  Copyright © 2020 Ariya Behjat. All rights reserved.
//

import UIKit

struct Meme: Codable {
    let id: UUID
    var topText: String
    var bottomText: String
    let date: Date
}
