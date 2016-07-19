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
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var formationCoachNotes: UITextView!
    @IBOutlet weak var formationBackButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        cardFront.hidden = false
        cardBack.hidden  = true
    }

    override func populateCell(dictionary: [String: String]) {
        formationIdentifier.text           = dictionary["Identifier"]
        formationImageView.image           = UIImage(named: dictionary["Identifier"]!)
        formationName.text                 = dictionary["Name"]
        formationKeyPositionTop.text       = dictionary["Top-KeyPosition"]
        formationKeyDescriptionTop.text    = dictionary["Top-KeyDescription"]
        formationKeyPositionBottom.text    = dictionary["Bottom-KeyPosition"]
        formationKeyDescriptionBottom.text = dictionary["Bottom-KeyDescription"]

        formationIdentifierBack.text       = dictionary["Identifier"]
        formationNameBack.text             = dictionary["Name"]
        formationCoachNotes.text           = dictionary["CoachNotes"]

        if formationCoachNotes.text.isEmpty {
            formationBuildButton.hidden = true
        } else {
            formationBuildButton.hidden = false
            formationCoachNotes.contentOffset = CGPointZero
        }
    }

    @IBAction func buildButtonPressed(sender: AnyObject) {
        flipViews(front: cardFront, back: cardBack)
    }

    @IBAction func editButtonTapped(sender: UIButton) {
        let editable = !formationCoachNotes.editable
        formationCoachNotes.editable = editable

        if editable {
            sender.setTitle("Done", forState: .Normal)
            formationCoachNotes.becomeFirstResponder()
            // TODO save data
        } else {
            sender.setTitle("Edit", forState: .Normal)
            formationCoachNotes.resignFirstResponder()
        }
    }

}
