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

        UIView.beginAnimations("cardFlip", context: nil)
        UIView.setAnimationDuration(0.8)
        UIView.setAnimationTransition(hidden ? .flipFromRight : .flipFromLeft, for: self, cache: true)

        front.isHidden = hidden
        back.isHidden  = !hidden

        UIView.commitAnimations()
    }
}
