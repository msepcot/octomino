//
//  OneKeyFormationCell.swift
//  Octomino
//
//  Created by Michael Sepcot on 4/6/15.
//  Copyright (c) 2015 Head Down Development. All rights reserved.
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
        }

        if let position = dictionary["KeyPosition"] {
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
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            let hidden = !self.cardFront.hidden

            self.cardFront.hidden = hidden
            self.cardBack.hidden  = !hidden
        })
    }
}
