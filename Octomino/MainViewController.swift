//
//  MainViewController.swift
//  Octomino
//
//  Created by Michael Sepcot on 4/4/15.
//  Copyright (c) 2015 Head Down Development. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var formationPageControl: UIPageControl!
    @IBOutlet weak var randomOrBlockControl: UISegmentedControl!
    @IBOutlet weak var informationButton: UIButton!

    var displayedFormationVC: FormationViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.


        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        displayedFormationVC = storyboard.instantiateViewControllerWithIdentifier("Formation") as? FormationViewController

        if let formationVC = displayedFormationVC {
            var formationView = formationVC.view
            formationView.frame = self.scrollView.bounds

            self.scrollView.addSubview(formationView)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

