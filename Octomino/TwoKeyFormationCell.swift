//
//  TwoKeyFormationCell.swift
//  Octomino
//
//  Created by Michael Sepcot on 4/6/15.
//  Copyright (c) 2015 Michael Sepcot. All rights reserved.
//

import UIKit

class TwoKeyFormationCell: FormationCell {

    @IBOutlet weak var cardFront: UIView!
    @IBOutlet weak var formationIdentifier: UILabel!
    @IBOutlet weak var formationImageView: UIImageView!
    @IBOutlet weak var formationName: UILabel!
    @IBOutlet weak var formationKeyPositionTop: UILabel!
    @IBOutlet weak var formationKeyDescriptionTop: UILabel!
    @IBOutlet weak var formationKeyPositionBottom: UILabel!
    @IBOutlet weak var formationKeyDescriptionBottom: UILabel!
    @IBOutlet weak var formationBuildButton: UIButton!

    @IBOutlet weak var cardBack: UIView!
    @IBOutlet weak var formationIdentifierBack: UILabel!
    @IBOutlet weak var formationNameBack: UILabel!
    @IBOutlet weak var formationCoachNotes: UITextView!
    @IBOutlet weak var formationBackButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        self.cardFront.hidden = false
        self.cardBack.hidden  = true
    }

    override func populateCell(dictionary: [String: String]) {
        self.formationIdentifier.text           = dictionary["Identifier"]
        self.formationImageView.image           = UIImage(named: dictionary["Identifier"]!)
        self.formationName.text                 = dictionary["Name"]
        self.formationKeyPositionTop.text       = dictionary["Top-KeyPosition"]
        self.formationKeyDescriptionTop.text    = dictionary["Top-KeyDescription"]
        self.formationKeyPositionBottom.text    = dictionary["Bottom-KeyPosition"]
        self.formationKeyDescriptionBottom.text = dictionary["Bottom-KeyDescription"]

        self.formationIdentifierBack.text       = dictionary["Identifier"]
        self.formationNameBack.text             = dictionary["Name"]
        self.formationCoachNotes.text           = dictionary["CoachNotes"]

        if self.formationCoachNotes.text.isEmpty {
            self.formationBuildButton.hidden = true
        } else {
            self.formationBuildButton.hidden = false
            self.formationCoachNotes.contentOffset = CGPointZero
        }
    }

    @IBAction func buildButtonPressed(sender: AnyObject) {
        let hidden = !self.cardFront.hidden

        UIView.beginAnimations("cardFlip", context: nil)
        UIView.setAnimationDuration(0.8)
        UIView.setAnimationTransition(hidden ? .FlipFromRight : .FlipFromLeft, forView: self, cache: true)

        self.cardFront.hidden = hidden
        self.cardBack.hidden  = !hidden

        UIView.commitAnimations()
    }

}
