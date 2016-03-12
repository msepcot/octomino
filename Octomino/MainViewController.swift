//
//  MainViewController.swift
//  Octomino
//
//  Created by Michael Sepcot on 4/4/15.
//  Copyright (c) 2015 Michael Sepcot. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var formationPageControl: UIPageControl!
    @IBOutlet weak var randomOrBlockControl: UISegmentedControl!
    @IBOutlet weak var informationButton: UIButton!

    var randoms: [[String: String]]!
    var randomIndex = 0

    var blocks:  [[String: String]]!
    var blockIndex = 0

    var firstLoad = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        collectionView.delegate = self
        collectionView.dataSource = self

        formationPageControl.addTarget(self, action: "pageChanged:",    forControlEvents: .ValueChanged)
        randomOrBlockControl.addTarget(self, action: "segmentChanged:", forControlEvents: .ValueChanged)
        randomOrBlockControl.addTarget(self, action: "segmentReselected:", forControlEvents: .Reselected)

        let oneKeyNib = UINib(nibName: "OneKeyFormationCell", bundle: nil)
        collectionView.registerNib(oneKeyNib,
            forCellWithReuseIdentifier: "OneKeyFormationCell-Identifier")

        let twoKeyNib = UINib(nibName: "TwoKeyFormationCell", bundle: nil)
        collectionView.registerNib(twoKeyNib,
            forCellWithReuseIdentifier: "TwoKeyFormationCell-Identifier")

        let notesNib = UINib(nibName: "NotesCell", bundle: nil)
        collectionView.registerNib(notesNib,
            forCellWithReuseIdentifier: "NotesCell-Identifier")

        if  let path = NSBundle.mainBundle().pathForResource("Formations", ofType: "plist"),
            let formations = NSDictionary(contentsOfFile: path)
        {
            randoms = formations["Randoms"] as! [[String: String]]
            blocks  = formations["Blocks"]  as! [[String: String]]
        }

        formationPageControl.numberOfPages = randoms.count
        formationPageControl.currentPage   = 0
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if firstLoad {
            collectionView.contentOffset = CGPoint(x: collectionView.bounds.width, y: 0)
            firstLoad = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UIPageControl notification

    func pageChanged(pageControl: UIPageControl) {
        let page = pageControl.currentPage
        let pageWidth = Int(collectionView.bounds.width)

        if randomOrBlockControl.selectedSegmentIndex == 0 {
            // Randoms - skip the first page in the collectionView
            collectionView.contentOffset = CGPoint(x: pageWidth * (page + 1), y: 0)
            randomIndex = page
        } else {
            // Blocks - skip over the randoms
            let collectionViewPage = page + randoms.count + 1
            collectionView.contentOffset = CGPoint(x: pageWidth * collectionViewPage, y: 0)
            blockIndex = page
        }
    }

    // MARK: - UISegmentedControl notification

    func segmentChanged(segmentedControl: UISegmentedControl) {
        let pageWidth = Int(collectionView.bounds.width)

        if segmentedControl.selectedSegmentIndex == 0 {
            collectionView.contentOffset = CGPoint(x: pageWidth * (randomIndex + 1), y: 0)
            formationPageControl.numberOfPages = randoms.count
            formationPageControl.currentPage = randomIndex
        } else {
            collectionView.contentOffset = CGPoint(x: pageWidth * (randoms.count + blockIndex + 1), y: 0)
            formationPageControl.numberOfPages = blocks.count
            formationPageControl.currentPage = blockIndex
        }
    }

    func segmentReselected(segmentedControl: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 0 {
            randomIndex = 1
        } else {
            blockIndex = 0
        }

        segmentChanged(segmentedControl)
    }

}

// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {}

// MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {

    func collectionView(collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int
    {
        return randoms.count + blocks.count + 2 // add two for copy of first and last formation
    }

    func collectionView(collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let formation: [String: String]!

        if indexPath.row == 0 {
            formation = blocks.last
        } else if indexPath.row == (randoms.count + blocks.count + 1) {
            formation = randoms.first
        } else if indexPath.row <= randoms.count {
            formation = randoms[indexPath.row - 1]
        } else {
            formation = blocks[indexPath.row - randoms.count - 1]
        }

        let reuseIdentifier = "\(formation["Class"]!)-Identifier"

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! FormationCell
        cell.populateCell(formation)

        return cell
    }

}

// MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return collectionView.bounds.size
    }

    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat
    {
        return 0
    }

}

// MARK: - UIScrollViewDelegate

extension MainViewController: UIScrollViewDelegate {

    func adjustPaging(scrollView: UIScrollView) {
        let pageWidth = scrollView.bounds.width
        let page = Int(scrollView.contentOffset.x / pageWidth)
        let contentWidth = scrollView.contentSize.width

        if page == 0 {
            scrollView.contentOffset = CGPoint(x: contentWidth - pageWidth * 2, y: 0)
            randomOrBlockControl.selectedSegmentIndex = 1
            formationPageControl.numberOfPages = blocks.count
            formationPageControl.currentPage = blocks.count - 1
        } else if page == (randoms.count + blocks.count + 1) {
            scrollView.contentOffset = CGPoint(x: pageWidth, y: 0)
            randomOrBlockControl.selectedSegmentIndex = 0
            formationPageControl.numberOfPages = randoms.count
            formationPageControl.currentPage = 0
        } else if page < randoms.count + 1 {
            randomOrBlockControl.selectedSegmentIndex = 0
            formationPageControl.numberOfPages = randoms.count
            formationPageControl.currentPage = page - 1
        } else {
            randomOrBlockControl.selectedSegmentIndex = 1
            formationPageControl.numberOfPages = blocks.count
            formationPageControl.currentPage = page - randoms.count - 1
        }

        if randomOrBlockControl.selectedSegmentIndex == 0 {
            randomIndex = formationPageControl.currentPage
        } else {
            blockIndex = formationPageControl.currentPage
        }
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        adjustPaging(scrollView)
    }

    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        adjustPaging(scrollView)
    }

}
