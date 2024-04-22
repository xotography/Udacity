//
//  VimeoUploadLinkResponse .swift
//  Snapvideo
//
//  Created by Ariya Behjat on 23/04/2020.
//  Copyright © 2020 Ariya Behjat. All rights reserved.
//

import Foundation
import VimeoNetworking

struct VimeoUploadLinkResponse: Codable {
    struct Upload: Codable {
        let uploadLink: String
        
        enum CodingKeys: String, CodingKey {
            case uploadLink = "upload_link"
        }
    }
    
    let upload: Upload
}
