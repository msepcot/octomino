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

        cardFront.isHidden = false
        cardBack.isHidden  = true
    }

    override func populateCell(dictionary: [String: String]) {
        formationIdentifier.text     = dictionary["Identifier"]
        formationImageView.image     = UIImage(named: dictionary["Image"]!)
        formationName.text           = dictionary["Name"]
        formationKeyPosition.text    = dictionary["KeyPosition"]
        formationKeyDescription.text = dictionary["KeyDescription"]

        formationIdentifierBack.text = dictionary["Identifier"]
        formationNameBack.text       = dictionary["Name"]
        formationCoachNotes.text     = dictionary["CoachNotes"]

        if formationCoachNotes.text.isEmpty {
            formationBuildButton.isHidden = true
        } else {
            formationBuildButton.isHidden = false
            formationCoachNotes.contentOffset = .zero
        }

        let shouldHideKey = (dictionary["KeyPosition"] == nil) // should only be `true` for Exit Frame
        keyImageView.isHidden = shouldHideKey
        formationKeyPosition.isHidden = shouldHideKey
        formationKeyDescription.isHidden = shouldHideKey
    }

    @IBAction func buildButtonPressed(_ sender: AnyObject) {
        flipViews(front: cardFront, back: cardBack)
    }

}
