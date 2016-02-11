//
//  RandomController.swift
//  Octomino
//
//  Created by Michael Sepcot on 5/15/15.
//  Copyright (c) 2015 Michael Sepcot. All rights reserved.
//

import WatchKit
import Foundation

class RandomController: WKInterfaceController {

    @IBOutlet weak var formationImage: WKInterfaceImage!
    @IBOutlet weak var formationName: WKInterfaceLabel!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        guard let config = context as? [String: Int], let index = config["index"] else { return }

        // Configure interface objects here.

        if  let path        = NSBundle.mainBundle().pathForResource("Formations", ofType: "plist"),
            let formations  = NSDictionary(contentsOfFile: path),
            let randoms     = formations["Randoms"] as? [[String : String]]
        {
            let formation = randoms[index]

            setTitle("\(formation["Identifier"]!): \(formation["Name"]!)")

            formationImage.setImageNamed(formation["Identifier"])
            formationName.setText(formation["Name"])
        }
    }

}
