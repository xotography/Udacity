//
//  Photo+Init.swift
//  VirtualTourist
//
//  Created by Ariya Behjat on 07/04/2020.
//  Copyright © 2020 Ariya Behjat. All rights reserved.
//

import CoreData

extension Photo {
    convenience init() {
        self.init(entity: Photo.entity(),
                  insertInto: nil)
    }
}
