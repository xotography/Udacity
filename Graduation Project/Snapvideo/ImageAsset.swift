//
//  ImageAsset.swift
//  Snapvideo
//
//  Created by Ariya Behjat on 13/02/2020.
//  Copyright © 2020 Ariya Behjat. All rights reserved.
//

import Foundation
import UIKit

protocol ImageAssets: ImageRepresentable, RawRepresentable, CustomStringConvertible where RawValue == String { }

protocol ImageRepresentable {
    func image() -> UIImage
}

extension ImageAssets {
    func image() -> UIImage {
        return UIImage(named: rawValue, in: .main, with: nil) ?? UIImage()
    }
    
    var description: String {
        rawValue.camelCaseToWords().capitalized
    }
}

enum ImageAsset: String, ImageAssets, Equatable {
    case addButton
    case cancel
    case done
    case effects
    case logo
    case placeholder
    case playCircle
    case saveVideoCopyImage
    case saveVideoImage
}

