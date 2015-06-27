//
//  OneKeyFormationCell.swift
//  Octomino
//
//  Created by Michael Sepcot on 4/6/15.
//  Copyright (c) 2015 Michael Sepcot. All rights reserved.
//

import UIKit

class OneKeyFormationCell: FormationCell {

    @IBOutlet weak var cardFront: UIView!
    @IBOutlet weak var formationImageView: UIImageView!
    @IBOutlet weak var formationIdentifier: UILabel!
    @IBOutlet weak var formationName: UILabel!
    @IBOutlet weak var keyImageView: UIImageView!
    @IBOutlet weak var formationKeyPosition: UILabel!
    @IBOutlet weak var formationKeyDescription: UILabel!
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
        self.formationIdentifier.text     = dictionary["Identifier"]
        self.formationImageView.image     = UIImage(named: dictionary["Identifier"]!)
        self.formationName.text           = dictionary["Name"]
        self.formationKeyPosition.text    = dictionary["KeyPosition"]
        self.formationKeyDescription.text = dictionary["KeyDescription"]

        self.formationIdentifierBack.text = dictionary["Identifier"]
        self.formationNameBack.text       = dictionary["Name"]
        self.formationCoachNotes.text     = dictionary["CoachNotes"]

        if self.formationCoachNotes.text.isEmpty {
            self.formationBuildButton.hidden = true
        } else {
            self.formationBuildButton.hidden = false
            self.formationCoachNotes.contentOffset = CGPointZero
        }

        if let _ = dictionary["KeyPosition"] {
            self.keyImageView.hidden = false
            self.formationKeyPosition.hidden = false
            self.formationKeyDescription.hidden = false
        } else {
            self.keyImageView.hidden = true
            self.formationKeyPosition.hidden = true
            self.formationKeyDescription.hidden = true
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
