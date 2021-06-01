//
//  InfoViewController.swift
//  Octomino
//
//  Created by Michael Sepcot on 4/10/15.
//  Copyright (c) 2015 Michael Sepcot. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

  @IBOutlet weak var multiwayControl: UISegmentedControl!
  @IBOutlet weak var positionsImageView: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        let userDefaults = UserDefaults.init(suiteName: "com.sepcot.octomino")
        let discipline = userDefaults?.string(forKey: "formation.discipline") ?? "8way"
        positionsImageView.image = UIImage(named: "\(discipline)-Positions")
        multiwayControl.selectedSegmentIndex = (discipline == "4way") ? 0 : 1

        // Can't set this in the storyboard? iOS 14.5 shows up white
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        multiwayControl.setTitleTextAttributes(titleTextAttributes, for: .normal)
        multiwayControl.setTitleTextAttributes(titleTextAttributes, for: .selected)

        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(InfoViewController.hide))
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// MARK: - UITapGestureRecognizer

    @objc func hide() {
        dismiss(animated: true, completion: nil)
    }

// MARK: - UISegmentedControl notification

  @IBAction func segmentChanged(_ sender: Any) {
    if let segmentedControl = sender as? UISegmentedControl {
      let userDefaults = UserDefaults.init(suiteName: "com.sepcot.octomino")
      let discipline = (segmentedControl.selectedSegmentIndex == 0) ? "4way" : "8way"
      userDefaults?.setValue(discipline, forKey: "formation.discipline")
      positionsImageView.image = UIImage(named: "\(discipline)-Positions")

      UIApplication.shared.setAlternateIconName((segmentedControl.selectedSegmentIndex == 0) ? "ParagonIcon" : nil) { error in
        if let error = error {
          print(error)
        }
      }
    }
  }

  override func viewWillDisappear(_ animated: Bool) {
    (self.presentingViewController as? MainViewController)?.unwindToMain()
  }
}
