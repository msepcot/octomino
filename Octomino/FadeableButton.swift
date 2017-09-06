//
//  FadeableButton.swift
//  Octomino
//
//  Created by Michael Sepcot on 9/5/17.
//  Copyright © 2017 Head Down Development. All rights reserved.
//

import UIKit

class FadeableButton: UIControl {
    static private let fadeAlpha:CGFloat = 0.2
    static private let fadeDuration = 0.3
    static private let touchAccessibilityDrift:CGFloat = 70

    private var isFaded = false

    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        fade(true, animated: false)

        return true
    }

    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let expandedTouchTarget = CGRect(
            x: -FadeableButton.touchAccessibilityDrift,
            y: -FadeableButton.touchAccessibilityDrift,
            width: frame.width + FadeableButton.touchAccessibilityDrift * 2,
            height: frame.height + FadeableButton.touchAccessibilityDrift * 2
        )

        if expandedTouchTarget.contains(touch.location(in: self)) {
            fade(true, animated: true)
        } else {
            fade(false, animated: true)
        }

        return true
    }

    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        fade(false, animated: true)

        super.endTracking(touch, with: event)
    }

    override func cancelTracking(with event: UIEvent?) {
        fade(false, animated: true)

        super.cancelTracking(with: event)
    }

    private func fade(_ shouldFade: Bool, animated: Bool) {
        guard isFaded != shouldFade else { return }

        isFaded = shouldFade
        UIView.animate(withDuration: animated ? FadeableButton.fadeDuration : 0.0) {
            self.alpha = shouldFade ? FadeableButton.fadeAlpha : 1.0
        }
    }
}

