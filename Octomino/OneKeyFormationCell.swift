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

        cardFront.hidden = false
        cardBack.hidden  = true
    }

    override func populateCell(dictionary: [String: String]) {
        formationIdentifier.text     = dictionary["Identifier"]
        formationImageView.image     = UIImage(named: dictionary["Identifier"]!)
        formationName.text           = dictionary["Name"]
        formationKeyPosition.text    = dictionary["KeyPosition"]
        formationKeyDescription.text = dictionary["KeyDescription"]

        formationIdentifierBack.text = dictionary["Identifier"]
        formationNameBack.text       = dictionary["Name"]
        formationCoachNotes.text     = dictionary["CoachNotes"]

        if formationCoachNotes.text.isEmpty {
            formationBuildButton.hidden = true
        } else {
            formationBuildButton.hidden = false
            formationCoachNotes.contentOffset = CGPointZero
        }

        if let _ = dictionary["KeyPosition"] {
            keyImageView.hidden = false
            formationKeyPosition.hidden = false
            formationKeyDescription.hidden = false
        } else {
            keyImageView.hidden = true
            formationKeyPosition.hidden = true
            formationKeyDescription.hidden = true
        }
    }

    @IBAction func buildButtonPressed(sender: AnyObject) {
        flipViews(front: cardFront, back: cardBack)
    }

}
