//
//  TesrBundle.swift
//  MemeTests
//
//  Created by Ariya Behjat on 21/02/2020.
//  Copyright © 2020 Ariya Behjat. All rights reserved.
//

import Foundation

extension Bundle {
    static let unitTests = Bundle(for: BundleLocator.self)
}

private class BundleLocator {}
