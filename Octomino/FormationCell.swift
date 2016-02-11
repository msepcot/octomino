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

    func flipViews(front front: UIView, back: UIView) {
        let hidden = !front.hidden

        UIView.beginAnimations("cardFlip", context: nil)
        UIView.setAnimationDuration(0.8)
        UIView.setAnimationTransition(hidden ? .FlipFromRight : .FlipFromLeft, forView: self, cache: true)

        front.hidden = hidden
        back.hidden  = !hidden

        UIView.commitAnimations()
    }
}
