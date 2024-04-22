//
//  FlickrPhotoRequest.swift
//  VirtualTourist
//
//  Created by Ariya Behjat on 05/04/2020.
//  Copyright © 2020 Ariya Behjat. All rights reserved.
//

struct FlickrPhotoRequest: Codable {
    let id: String
    let farm: Int
    let server: String
    let secret: String
}
