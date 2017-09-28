//
//  SeparatorGroup.swift
//  Octomino
//
//  Created by Michael Sepcot on 9/10/17.
//  Copyright © 2017 Head Down Development. All rights reserved.
//

import UIKit

@IBDesignable class SeparatorGroup: UIView {
    override func draw(_ rect: CGRect) {
        UIColor.lightGray.setStroke()

        let pixel = 1.0 / UIScreen.main.scale

        let separator = UIBezierPath()
        separator.move(to: CGPoint(x: rect.origin.x, y: pixel))
        separator.addLine(to: CGPoint(x: rect.maxX, y: pixel))
        separator.lineWidth = pixel
        separator.stroke()
    }
}
