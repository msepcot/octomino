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
    static let Reselected = UIControlEvents(rawValue: 1 << 28)
}

let Reselected = UIControlEvents(rawValue: 1 << 28)

class ReselectableSegmentedControl: UISegmentedControl {
    @IBInspectable var allowReselection: Bool = true

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let previousSelectedSegmentIndex = self.selectedSegmentIndex

        super.touchesEnded(touches, withEvent: event)

        if allowReselection && previousSelectedSegmentIndex == self.selectedSegmentIndex {
            if let touch = touches.first where CGRectContainsPoint(bounds, touch.locationInView(self)) {
                self.sendActionsForControlEvents(.Reselected)
            }
        }
    }
}