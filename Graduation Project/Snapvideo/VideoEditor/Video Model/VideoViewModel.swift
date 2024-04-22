//
//  VideoViewModel.swift
//  Snapvideo
//
//  Created by Ariya Behjat on 21/04/2020.
//  Copyright © 2020 Ariya Behjat. All rights reserved.
//

import Foundation
import EasyCoreData

struct VideoViewModel: CoreDataMappable {
    let url: URL?
    let index: Int16
    
    init(model: Video) {
        url = model.url
        index = model.index
    }
}
