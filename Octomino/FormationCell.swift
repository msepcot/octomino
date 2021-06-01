//
//  FormationCell.swift
//  Octomino
//
//  Created by Michael Sepcot on 4/8/15.
//  Copyright (c) 2015 Michael Sepcot. All rights reserved.
//

import UIKit

class FormationCell: UICollectionViewCell {

    func populateCell(dictionary: [String: String]) {}

    func flipViews(front: UIView, back: UIView) {
        let hidden = !front.isHidden

      UIView.transition(with: self, duration: 0.8, options: (hidden ? .transitionFlipFromRight : .transitionFlipFromLeft)) {
        front.isHidden = hidden
        back.isHidden  = !hidden
      } completion: { _ in
        // nothing to see here, flip happens in the animation block
      }
    }
}
