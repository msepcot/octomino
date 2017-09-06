//
//  FilterButton.swift
//  Octomino
//
//  Created by Michael Sepcot on 8/29/17.
//  Copyright © 2017 Head Down Development. All rights reserved.
//

import UIKit

@IBDesignable class FilterButton: FadeableButton {
    private let buttonSize:CGFloat = 21
    private let topLineLength:CGFloat = 14
    private let middleLineLength:CGFloat = 10
    private let bottomLineLength:CGFloat = 6

    @IBInspectable var _isSelected: Bool = false {
        willSet {
            isSelected = newValue
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {
        tintColor.setStroke()
        tintColor.setFill()

        let offsetX = (rect.size.width - buttonSize) / 2
        let offsetY = (rect.size.height - buttonSize) / 2

        let circle = UIBezierPath(ovalIn: CGRect(x: offsetX, y: offsetY, width: buttonSize, height: buttonSize))
        if isSelected {
            circle.fill()
        }
        circle.lineWidth = 1
        circle.stroke()

        if isSelected {
            UIColor.white.setStroke()
        }

        let topOffsetX = (rect.size.width - topLineLength) / 2
        drawLine(from: CGPoint(x: topOffsetX, y: offsetY + 7),
                   to: CGPoint(x: topOffsetX + topLineLength, y: offsetY + 7))

        let middleOffsetX = (rect.size.width - middleLineLength) / 2
        drawLine(from: CGPoint(x: middleOffsetX, y: offsetY + 11),
                   to: CGPoint(x: middleOffsetX + middleLineLength, y: offsetY + 11))

        let bottomOffsetX = (rect.size.width - bottomLineLength) / 2
        drawLine(from: CGPoint(x: bottomOffsetX, y: offsetY + 15),
                   to: CGPoint(x: bottomOffsetX + bottomLineLength, y: offsetY + 15))
    }

    func drawLine(from startPoint: CGPoint, to endPoint: CGPoint) {
        let line = UIBezierPath()
        line.move(to: startPoint)
        line.addLine(to: endPoint)
        line.lineWidth = 1
        line.stroke()
    }
}
