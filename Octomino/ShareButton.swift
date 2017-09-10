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

        let offsetX = (rect.size.width - 18) / 2
        let offsetY = (rect.size.height - 26) / 2

        let box = UIBezierPath()
        box.move(to: CGPoint(x: 7 + offsetX, y: 8.5 + offsetY))
        box.addLine(to: CGPoint(x: 0.5 + offsetX, y: 8.5 + offsetY))
        box.addLine(to: CGPoint(x: 0.5 + offsetX, y: 26.5 + offsetY))
        box.addLine(to: CGPoint(x: 18.5 + offsetX, y: 26.5 + offsetY))
        box.addLine(to: CGPoint(x: 18.5 + offsetX, y: 8.5 + offsetY))
        box.addLine(to: CGPoint(x: 12 + offsetX, y: 8.5 + offsetY))
        box.lineWidth = 1
        box.stroke()

        let arrowHead = UIBezierPath()
        arrowHead.move(to: CGPoint(x: 5.5 + offsetX, y: 5 + offsetY))
        arrowHead.addLine(to: CGPoint(x: 9.5 + offsetX, y: 0.5 + offsetY))
        arrowHead.addLine(to: CGPoint(x: 13.5 + offsetX, y: 5 + offsetY))
        arrowHead.lineWidth = 1
        arrowHead.stroke()

        let arrowShaft = UIBezierPath()
        arrowShaft.move(to: CGPoint(x: 9.5 + offsetX, y: 1 + offsetY))
        arrowShaft.addLine(to: CGPoint(x: 9.5 + offsetX, y: 17 + offsetY))
        arrowShaft.lineWidth = 1
        arrowShaft.stroke()
    }
}
