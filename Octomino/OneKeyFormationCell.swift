//
//  OneKeyFormationCell.swift
//  Octomino
//
//  Created by Michael Sepcot on 4/6/15.
//  Copyright (c) 2015 Head Down Development. All rights reserved.
//

import UIKit

class OneKeyFormationCell: FormationCell {
    @IBOutlet weak var formationImageView: UIImageView!
    @IBOutlet weak var formationIdentifier: UILabel!
    @IBOutlet weak var formationName: UILabel!
    @IBOutlet weak var keyImageView: UIImageView!
    @IBOutlet weak var formationKeyPosition: UILabel!
    @IBOutlet weak var formationKeyDescription: UILabel!
    @IBOutlet weak var formationBuildButton: UIButton!

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

        if let position = dictionary["KeyPosition"] where position.isEmpty {
            self.keyImageView.hidden = true
            self.formationKeyPosition.hidden = true
            self.formationKeyDescription.hidden = true
        } else {
            self.keyImageView.hidden = false
            self.formationKeyPosition.hidden = false
            self.formationKeyDescription.hidden = false
        }
    }

    @IBAction func buildButtonPressed(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            let alpha = 1.0 - self.formationImageView.alpha

            self.formationImageView.alpha       = alpha
            self.formationName.alpha            = alpha
            self.keyImageView.alpha             = alpha
            self.formationKeyPosition.alpha     = alpha
            self.formationKeyDescription.alpha  = alpha
        })
    }
}
