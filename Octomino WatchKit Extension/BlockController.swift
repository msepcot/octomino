//
//  BlockController.swift
//  Octomino
//
//  Created by Michael Sepcot on 5/15/15.
//  Copyright (c) 2015 Michael Sepcot. All rights reserved.
//

import WatchKit
import Foundation


class BlockController: WKInterfaceController {

    @IBOutlet weak var formationImageTop: WKInterfaceImage!
    @IBOutlet weak var formationImageInter: WKInterfaceImage!
    @IBOutlet weak var formationImageBottom: WKInterfaceImage!
    @IBOutlet weak var formationName: WKInterfaceLabel!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        guard let config = context as? [String: Int], let index = config["index"] else { return }

        // Configure interface objects here.

        if  let path        = Bundle.main.path(forResource: "Formations", ofType: "plist"),
            let formations  = NSDictionary(contentsOfFile: path),
            let blocks      = formations["Blocks"] as? [[String : String]]
        {
            let formation = blocks[index]

            setTitle("\(formation["Identifier"]!): \(formation["Name"]!)")

            formationImageTop.setImageNamed("\(formation["Identifier"]!)a")
            formationImageInter.setImageNamed("\(formation["Identifier"]!)b")
            formationImageBottom.setImageNamed("\(formation["Identifier"]!)c")
            formationName.setText(formation["Name"])
        }
    }

}
