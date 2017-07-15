//
//  ReselectableSegmentedControl.swift
//  Octomino
//
//  Created by Michael Sepcot on 3/11/16.
//  Copyright © 2016 Head Down Development. All rights reserved.
//  Modified solution from http://stackoverflow.com/questions/17652773/how-to-deselect-a-segment-in-segmented-control-button-permanently-till-its-click/17652998#17652998
//

import UIKit

extension UIControlEvents {
    static let reselected = UIControlEvents(rawValue: 1 << 28)
}

let reselected = UIControlEvents(rawValue: 1 << 28)

class ReselectableSegmentedControl: UISegmentedControl {
    @IBInspectable var allowReselection: Bool = true

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let previousSelectedSegmentIndex = self.selectedSegmentIndex

        super.touchesEnded(touches, with: event)

        if allowReselection && previousSelectedSegmentIndex == self.selectedSegmentIndex {
            if let touch = touches.first, bounds.contains(touch.location(in: self)) {
                self.sendActions(for: .reselected)
            }
        }
    }
}
