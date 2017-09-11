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

        let separator = UIBezierPath()
        separator.move(to: CGPoint(x: 0, y: 0.5))
        separator.addLine(to: CGPoint(x: rect.maxX, y: 0.5))
        separator.lineWidth = 1
        separator.stroke()
    }
}
