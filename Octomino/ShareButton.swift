//
//  ShareButton.swift
//  Octomino
//
//  Created by Michael Sepcot on 9/7/17.
//  Copyright © 2017 Head Down Development. All rights reserved.
//

import UIKit

@IBDesignable class ShareButton: FadeableButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {
        tintColor.setStroke()

        let box = UIBezierPath()
        box.move(to: CGPoint(x: 7, y: 8.5))
        box.addLine(to: CGPoint(x: 0.5, y: 8.5))
        box.addLine(to: CGPoint(x: 0.5, y: 26.5))
        box.addLine(to: CGPoint(x: 18.5, y: 26.5))
        box.addLine(to: CGPoint(x: 18.5, y: 8.5))
        box.addLine(to: CGPoint(x: 12, y: 8.5))
        box.lineWidth = 1
        box.stroke()

        let arrowHead = UIBezierPath()
        arrowHead.move(to: CGPoint(x: 5.5, y: 5))
        arrowHead.addLine(to: CGPoint(x: 9.5, y: 0.5))
        arrowHead.addLine(to: CGPoint(x: 13.5, y: 5))
        arrowHead.lineWidth = 1
        arrowHead.stroke()

        let arrowShaft = UIBezierPath()
        arrowShaft.move(to: CGPoint(x: 9.5, y: 1))
        arrowShaft.addLine(to: CGPoint(x: 9.5, y: 17))
        arrowShaft.lineWidth = 1
        arrowShaft.stroke()
    }
}
