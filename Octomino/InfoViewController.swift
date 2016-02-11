//
//  InfoViewController.swift
//  Octomino
//
//  Created by Michael Sepcot on 4/10/15.
//  Copyright (c) 2015 Michael Sepcot. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: "dismiss")
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// MARK: - UITapGestureRecognizer

    func dismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
