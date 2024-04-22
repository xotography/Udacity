//
//  Video+Init.swift
//  Snapvideo
//
//  Created by Ariya Behjat on 21/04/2020.
//  Copyright © 2020 Ariya Behjat. All rights reserved.
//

import CoreData

extension Video {
    convenience init() {
        self.init(entity: Video.entity(),
                  insertInto: nil)
    }
}
