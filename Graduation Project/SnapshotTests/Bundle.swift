//
//  Bundle.swift
//  SnapshotTests
//
//  Created by Ariya Behjat on 07/02/2020.
//  Copyright © 2020 Ariya Behjat. All rights reserved.
//

import Foundation

extension Bundle {
    static let snapshotTests = Bundle(for: Fake.self)
}

private class Fake {}

