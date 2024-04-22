//
//  SepiaFilter.swift
//  Snapvideo
//
//  Created by Ariya Behjat on 02/02/2020.
//  Copyright © 2020 Ariya Behjat. All rights reserved.
//

import Foundation
import CoreImage

struct SepiaFilter: Filter {
    let name: String = "Sepia"
    
    func apply(image: CIImage) -> CIImage {
        let optionalFilter = CIFilter(
            name:"CISepiaTone",
            parameters: [
                kCIInputImageKey: image,
                kCIInputIntensityKey: 0.5
            ]
        )
        guard let filter = optionalFilter else {
            return image
        }
        filter.setValue(image, forKey: kCIInputImageKey)
        return filter.outputImage ?? image
    }
}
