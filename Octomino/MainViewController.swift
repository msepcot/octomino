//
//  MainViewController.swift
//  Octomino
//
//  Created by Michael Sepcot on 4/4/15.
//  Copyright (c) 2015 Head Down Development. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,
    UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,
    UIScrollViewDelegate
{
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var formationPageControl: UIPageControl!
    @IBOutlet weak var randomOrBlockControl: UISegmentedControl!
    @IBOutlet weak var informationButton: UIButton!

    var randoms: [[String: String]]!
    var blocks:  [[String: String]]!
    var firstLoad = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.collectionView.delegate = self
        self.collectionView.dataSource = self

        self.formationPageControl.addTarget(self, action: "pageChanged:", forControlEvents: .ValueChanged)
        self.randomOrBlockControl.addTarget(self, action: "segmentChanged:", forControlEvents: .ValueChanged)

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

        self.formationPageControl.numberOfPages = self.randoms.count
        self.formationPageControl.currentPage = 0
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        if self.firstLoad {
            self.collectionView.contentOffset = CGPoint(x: self.collectionView.bounds.width, y: 0)
            self.firstLoad = false
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

// MARK: UIScrollViewDelegate methods

    func adjustPaging(scrollView: UIScrollView) {
        let pageWidth = scrollView.bounds.width
        let page = Int(scrollView.contentOffset.x / pageWidth)
        let contentWidth = scrollView.contentSize.width

        if page == 0 {
            scrollView.contentOffset = CGPoint(x: contentWidth - pageWidth * 2, y: 0)
            self.randomOrBlockControl.selectedSegmentIndex = 1
            self.formationPageControl.numberOfPages = self.blocks.count
            self.formationPageControl.currentPage = self.blocks.count - 1
        } else if page == (self.randoms.count + self.blocks.count + 1) {
            scrollView.contentOffset = CGPoint(x: pageWidth, y: 0)
            self.randomOrBlockControl.selectedSegmentIndex = 0
            self.formationPageControl.numberOfPages = self.randoms.count
            self.formationPageControl.currentPage = 0
        } else if page < self.randoms.count + 1 {
            self.randomOrBlockControl.selectedSegmentIndex = 0
            self.formationPageControl.numberOfPages = self.randoms.count
            self.formationPageControl.currentPage = page - 1
        } else {
            self.randomOrBlockControl.selectedSegmentIndex = 1
            self.formationPageControl.numberOfPages = self.blocks.count
            self.formationPageControl.currentPage = page - self.randoms.count - 1
        }
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.adjustPaging(scrollView)
    }

    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        self.adjustPaging(scrollView)
    }

// MARK: UIPageControl notification

    func pageChanged(pageControl: UIPageControl) {
        let page = pageControl.currentPage
        let pageWidth = Int(self.collectionView.bounds.width)

        if self.randomOrBlockControl.selectedSegmentIndex == 0 {
            // Randoms - skip the first page in the collectionView
            self.collectionView.contentOffset = CGPoint(x: pageWidth * (page + 1), y: 0)
        } else {
            // Blocks - skip over the randoms
            let collectionViewPage = page + self.randoms.count + 1
            self.collectionView.contentOffset = CGPoint(x: pageWidth * collectionViewPage, y: 0)
        }
    }

// MARK: UISegmentedControl notification

    func segmentChanged(segmentedControl: UISegmentedControl) {
        let pageWidth = Int(self.collectionView.bounds.width)

        if segmentedControl.selectedSegmentIndex == 0 {
            self.collectionView.contentOffset = CGPoint(x: pageWidth, y: 0)
            self.formationPageControl.numberOfPages = self.randoms.count
            self.formationPageControl.currentPage = 0
        } else {
            self.collectionView.contentOffset = CGPoint(x: pageWidth * (self.randoms.count + 1), y: 0)
            self.formationPageControl.numberOfPages = self.blocks.count
            self.formationPageControl.currentPage = 0
        }
    }

}
