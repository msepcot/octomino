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
    @IBOutlet weak var formationKeyPosition: UILabel!
    @IBOutlet weak var formationKeyDescription: UILabel!

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
    }
}
