//
//  VimeoUploadResponse.swift
//  Snapvideo
//
//  Created by Ariya Behjat on 24/04/2020.
//  Copyright © 2020 Ariya Behjat. All rights reserved.
//

import Foundation
import VimeoNetworking

struct VimeoUploadResponse: Codable {
    let uploadOffset: String
    
    enum CodingKeys: String, CodingKey {
        case uploadOffset = "Upload-Offset"
    }
}

