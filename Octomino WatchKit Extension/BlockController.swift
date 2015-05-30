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

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        let config = context as! [String : Int]
        let index = config["index"]

        let path = NSBundle.mainBundle().pathForResource("Formations", ofType: "plist")
        if let index = index, let path = path {
            if let formations = NSDictionary(contentsOfFile: path) {
                if let blocks = formations["Blocks"] as? [[String : String]] {
                    let formation = blocks[index]

                    self.setTitle(formation["Identifier"]! + ": " + formation["Name"]!)

                    self.formationImageTop.setImageNamed(formation["Identifier"]! + "a")
                    self.formationImageInter.setImageNamed(formation["Identifier"]! + "b")
                    self.formationImageBottom.setImageNamed(formation["Identifier"]! + "c")
                    self.formationName.setText(formation["Name"])
                }
            }
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
