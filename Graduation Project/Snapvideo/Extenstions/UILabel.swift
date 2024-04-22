//
//  UILabel.swift
//  Snapvideo
//
//  Created by Ariya Behjat on 21/03/2020.
//  Copyright © 2020 Ariya Behjat. All rights reserved.
//

import UIKit

extension UILabel {
    func setText(_ text: String, animationDuration duration: TimeInterval) {
        UIView.transition(
            with: self,
            duration: duration,
            options: .transitionCrossDissolve,
            animations: {  self.text = text },
            completion: nil
        )
    }
}
