//
//  TwoKeyFormationCell.swift
//  Octomino
//
//  Created by Michael Sepcot on 4/6/15.
//  Copyright (c) 2015 Head Down Development. All rights reserved.
//

import UIKit

class TwoKeyFormationCell: FormationCell {

    @IBOutlet weak var formationIdentifier: UILabel!
    @IBOutlet weak var formationImageView: UIImageView!
    @IBOutlet weak var formationName: UILabel!
    @IBOutlet weak var formationKeyPositionTop: UILabel!
    @IBOutlet weak var formationKeyDescriptionTop: UILabel!
    @IBOutlet weak var formationKeyPositionBottom: UILabel!
    @IBOutlet weak var formationKeyDescriptionBottom: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func populateCell(dictionary: [String: String]) {
        self.formationIdentifier.text           = dictionary["Identifier"]
        self.formationImageView.image           = UIImage(named: dictionary["Identifier"]!)
        self.formationName.text                 = dictionary["Name"]
        self.formationKeyPositionTop.text       = dictionary["Top-KeyPosition"]
        self.formationKeyDescriptionTop.text    = dictionary["Top-KeyDescription"]
        self.formationKeyPositionBottom.text    = dictionary["Bottom-KeyPosition"]
        self.formationKeyDescriptionBottom.text = dictionary["Bottom-KeyDescription"]
    }
}
