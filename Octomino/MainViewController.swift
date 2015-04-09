//
//  MainViewController.swift
//  Octomino
//
//  Created by Michael Sepcot on 4/4/15.
//  Copyright (c) 2015 Head Down Development. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,
    UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var formationPageControl: UIPageControl!
    @IBOutlet weak var randomOrBlockControl: UISegmentedControl!
    @IBOutlet weak var informationButton: UIButton!

    var randoms: [[String: String]]!
    var blocks:  [[String: String]]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.collectionView.backgroundColor = nil
        self.collectionView.delegate = self
        self.collectionView.dataSource = self

        let oneKeyNib = UINib(nibName: "OneKeyFormationCell", bundle: nil)
        self.collectionView.registerNib(oneKeyNib,
            forCellWithReuseIdentifier: "OneKeyFormationCell-Identifier")

        let twoKeyNib = UINib(nibName: "TwoKeyFormationCell", bundle: nil)
        self.collectionView.registerNib(twoKeyNib,
            forCellWithReuseIdentifier: "TwoKeyFormationCell-Identifier")

        let path = NSBundle.mainBundle().pathForResource("Formations", ofType: "plist")
        if let path = path {
            if let formations = NSDictionary(contentsOfFile: path) {
                self.randoms = formations["Randoms"] as! [[String: String]]
                self.blocks  = formations["Blocks"]  as! [[String: String]]
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// MARK: UICollectionViewDelegate methods

    func collectionView(collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int
    {
        return randoms.count + blocks.count + 2 // add two for copy of first and last formation
    }

    func collectionView(collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        var cell: FormationCell
        var klass: String?
        var formation: [String: String]?

        if indexPath.row == 0 {
            formation = self.blocks.last
            if let formation = formation {
                klass = formation["Class"]
            }
        } else if indexPath.row == (self.randoms.count + self.blocks.count + 1) {
            formation = self.randoms.first
            if let formation = formation {
                klass = formation["Class"]
            }
        } else if indexPath.row <= self.randoms.count {
            formation = self.randoms[indexPath.row - 1]
            if let formation = formation {
                klass = formation["Class"]
            }
        } else {
            formation = self.blocks[indexPath.row - self.randoms.count - 1]
            if let formation = formation {
                klass = formation["Class"]
            }
        }

        cell = collectionView.dequeueReusableCellWithReuseIdentifier(klass! + "-Identifier", forIndexPath: indexPath) as! FormationCell
        cell.populateCell(formation!)

        return cell
    }

// MARK: UICollectionViewDelegateFlowLayout methods

    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }

    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat
    {
        return 0
    }

}

