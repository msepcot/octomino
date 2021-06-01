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

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        guard let config = context as? [String: Int],
            let index = config["index"],
            let path = Bundle.main.path(forResource: "Formations", ofType: "plist"),
            let formations = NSDictionary(contentsOfFile: path),
            let multiway = formations["8way"] as? [String: [[String: String]]]
        else { return }

        // Configure interface objects here.

        let formation = multiway["Randoms"]![index]
        if let identifier = formation["Identifier"], let name = formation["Name"] {
            setTitle("\(identifier): \(name)")
            formationImage.setImageNamed(identifier)
            formationName.setText(name)
        }
    }

}
