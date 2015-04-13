//
//  NotesCell.swift
//  Octomino
//
//  Created by Michael Sepcot on 4/10/15.
//  Copyright (c) 2015 Head Down Development. All rights reserved.
//

import UIKit

class NotesCell: FormationCell {

    @IBOutlet weak var formationIdentifier: UILabel!
    @IBOutlet weak var formationName: UILabel!
    @IBOutlet weak var playerNotes: UILabel!
    @IBOutlet weak var coachNotes: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func populateCell(dictionary: [String: String]) {
        self.formationIdentifier.text = dictionary["Identifier"]
        self.formationName.text       = dictionary["Name"]
    }
}
