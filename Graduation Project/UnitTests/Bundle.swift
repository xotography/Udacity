//
//  Bundle.swift
//  Snapvideo
//
//  Created by Ariya Behjat on 02/02/2020.
//  Copyright © 2020 Ariya Behjat. All rights reserved.
//

import Foundation

extension Bundle {
    static let unitTests = Bundle(for: Fake.self)
}

private class Fake {}
