//
//  String.swift
//  Snapvideo
//
//  Created by Ariya Behjat on 13/02/2020.
//  Copyright © 2020 Ariya Behjat. All rights reserved.
//

import Foundation

extension String {
    func camelCaseToWords() -> String {
        let regex = try! NSRegularExpression(pattern: "[A-Z]")
        return regex.stringByReplacingMatches(
            in: self,
            range: NSRange(0..<self.utf16.count),
            withTemplate: " $0"
        )
    }
}
