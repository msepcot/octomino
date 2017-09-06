//
//  FilterButton.swift
//  Octomino
//
//  Created by Michael Sepcot on 8/29/17.
//  Copyright © 2017 Head Down Development. All rights reserved.
//

import UIKit

@IBDesignable class FilterButton: UIControl {
    private let touchAccessibilityDrift:CGFloat = 70
    private let buttonSize:CGFloat = 22
    private var isFaded = false

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

        drawLine(from: CGPoint(x: offsetX +  4, y: offsetY +  7),
                   to: CGPoint(x: offsetX + 18, y: offsetY +  7))
        drawLine(from: CGPoint(x: offsetX +  6, y: offsetY + 11),
                   to: CGPoint(x: offsetX + 16, y: offsetY + 11))
        drawLine(from: CGPoint(x: offsetX +  8, y: offsetY + 15),
                   to: CGPoint(x: offsetX + 14, y: offsetY + 15))
    }

    func drawLine(from startPoint: CGPoint, to endPoint: CGPoint) {
        let line = UIBezierPath()
        line.move(to: startPoint)
        line.addLine(to: endPoint)
        line.lineWidth = 1
        line.stroke()
    }

    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        fade(true, animated: false)
        return true
    }

    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let expandedTouchTarget = CGRect(
            x: -touchAccessibilityDrift,
            y: -touchAccessibilityDrift,
            width: frame.width + touchAccessibilityDrift * 2,
            height: frame.height + touchAccessibilityDrift * 2
        )

        if expandedTouchTarget.contains(touch.location(in: self)) {
            fade(true)
        } else {
            fade(false)
        }
        return true
    }

    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        fade(false)
        super.endTracking(touch, with: event)
    }

    override func cancelTracking(with event: UIEvent?) {
        fade(false)
        super.cancelTracking(with: event)
    }

    private func fade(_ shouldFade: Bool, animated: Bool = true) {
        guard isFaded != shouldFade else { return }

        isFaded = shouldFade
        UIView.animate(withDuration: animated ? 0.3 : 0.0) {
            self.alpha = shouldFade ? 0.20 : 1.0
        }
    }
}
