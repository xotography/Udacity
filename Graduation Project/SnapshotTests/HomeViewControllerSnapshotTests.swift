//
//  HomeViewControllerSnapshotTests.swift
//  SnapvideoTests
//
//  Created by Ariya Behjat on 06/02/2020.
//  Copyright © 2020 Ariya Behjat. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import Snapvideo

final class HomeViewControllerSnapshotTests: XCTestCase {
    func testHomeViewController() {
      let vc = HomeViewController()

      assertSnapshot(matching: vc, as: .image)
    }
}
