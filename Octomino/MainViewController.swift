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

    var discipline: String!
    var firstLoad = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        collectionView.delegate = self
        collectionView.dataSource = self

        formationPageControl.addTarget(self, action: #selector(MainViewController.pageChanged(_:)), for: .valueChanged)
        randomOrBlockControl.addTarget(self, action: #selector(MainViewController.segmentChanged(_:)), for: .valueChanged)
        randomOrBlockControl.addTarget(self, action: #selector(MainViewController.segmentReselected(_:)), for: .reselected)

        collectionView.register(
            UINib(nibName: "OneKeyFormationCell", bundle: nil),
            forCellWithReuseIdentifier: "OneKeyFormationCell-Identifier"
        )

        collectionView.register(
            UINib(nibName: "TwoKeyFormationCell", bundle: nil),
            forCellWithReuseIdentifier: "TwoKeyFormationCell-Identifier"
        )

        collectionView.register(
            UINib(nibName: "NotesCell", bundle: nil),
            forCellWithReuseIdentifier: "NotesCell-Identifier"
        )

        let userDefaults = UserDefaults.init(suiteName: "com.sepcot.octomino")
        let formationSize = userDefaults?.string(forKey: "formation.discipline") ?? "8way"

        if  let path = Bundle.main.path(forResource: "Formations", ofType: "plist"),
            let formations = NSDictionary(contentsOfFile: path),
            let divePool = formations[formationSize] as? [String: [[String: String]]]
        {
          self.discipline = formationSize
          randoms = divePool["Randoms"]
          blocks  = divePool["Blocks"]
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

    @objc func pageChanged(_ pageControl: UIPageControl) {
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

    @objc func segmentChanged(_ segmentedControl: UISegmentedControl) {
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

    @objc func segmentReselected(_ segmentedControl: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 0 {
            randomIndex = (discipline == "8way" ? 1 : 0)
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

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randoms.count + blocks.count + 2 // add two for copy of first and last formation
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FormationCell
        cell.populateCell(dictionary: formation)

        return cell
    }

}

// MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return collectionView.bounds.size
    }

    func collectionView(_ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int) -> CGFloat
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

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        adjustPaging(scrollView: scrollView)
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        adjustPaging(scrollView: scrollView)
    }

}

// MARK: -

extension MainViewController {
  func unwindToMain() {
    let userDefaults = UserDefaults.init(suiteName: "com.sepcot.octomino")
    let formationSize = userDefaults?.string(forKey: "formation.discipline") ?? "8way"

    if formationSize != discipline {
      discipline = formationSize
      if  let path = Bundle.main.path(forResource: "Formations", ofType: "plist"),
          let formations = NSDictionary(contentsOfFile: path),
          let divePool = formations[formationSize] as? [String: [[String: String]]]
      {
        randoms = divePool["Randoms"]
        blocks  = divePool["Blocks"]
      }

      formationPageControl.numberOfPages = randoms.count
      formationPageControl.currentPage   = 0

      randomIndex = 0
      blockIndex = 0

      randomOrBlockControl.selectedSegmentIndex = 0

      collectionView.reloadData()
      collectionView.contentOffset = CGPoint(x: collectionView.bounds.width, y: 0)
    }
  }
}
