//
//  ControlStripHeader.swift
//  Octomino
//
//  Created by Michael Sepcot on 9/9/17.
//  Copyright © 2017 Head Down Development. All rights reserved.
//

import UIKit

class ControlStripHeader: UICollectionReusableView {
    @IBOutlet var headerLabel: UILabel!

    override func draw(_ rect: CGRect) {
        UIColor.lightGray.setStroke()

        let line = UIBezierPath()
        line.move(to: rect.origin)
        line.addLine(to: CGPoint(x: rect.origin.x, y: rect.maxY))
        line.lineWidth = 1
        line.stroke()
    }
}
