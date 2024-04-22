//
//  PassthroughFilter.swift
//  Snapvideo
//
//  Created by Ariya Behjat on 02/02/2020.
//  Copyright © 2020 Ariya Behjat. All rights reserved.
//

import Foundation
import CoreImage

struct PassthroughFilter: Filter {
    let name: String = "Original"
    
    func apply(image: CIImage) -> CIImage {
        return image
    }
}
