//
//  ControlStripViewController.swift
//  Octomino
//
//  Created by Michael Sepcot on 9/9/17.
//  Copyright © 2017 Head Down Development. All rights reserved.
//

import UIKit

private let cellIdentifier = String(describing: ControlStripCell.self)
private let headerIdentifier = String(describing: ControlStripHeader.self)
private let formations = [
    ["Randoms", "X", "A", "B", "C", "D", "E", "F", "G", "H", "J", "K", "L", "M", "N", "O", "P", "Q"],
    ["Blocks", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22"]
]
private let nationals2015 = [
    ["Round 1", "M", "J", "17"],
    ["Round 2", "E", "F", "H", "C"],
    ["Round 3", "N", "O", "8"],
    ["Round 4", "L", "19", "13"],
    ["Round 5", "21", "G", "14"],
    ["Round 6", "6", "P", "10"],
    ["Round 7", "1", "K", "D"],
    ["Round 8", "7", "Q", "B"],
    ["Round 9", "A", "18", "16"],
    ["Round 10", "3", "4"],
    ["TB Round", "B", "K", "E", "F"]
]

class ControlStripViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(
            UINib(nibName: "ControlStripCell", bundle: nil),
            forCellWithReuseIdentifier: cellIdentifier
        )

        self.collectionView!.register(
            UINib(nibName: "ControlStripHeader", bundle: nil),
            forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
            withReuseIdentifier: headerIdentifier
        )

        // Adjust flow layout sizing
        let flowLayout = self.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.footerReferenceSize = CGSize.zero
        flowLayout.headerReferenceSize = CGSize(width: 72, height: 14)
        flowLayout.sectionHeadersPinToVisibleBounds = true

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return formations.count
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return formations[section].count - 1 // Name of section is in slot 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ControlStripCell
    
        // Configure the cell
        let round = indexPath.first ?? 0
        let formation = (indexPath.last ?? 0) + 1
        cell.formationLabel.text = formations[round][formation]
    
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier, for: indexPath) as! ControlStripHeader

        // Configure the cell
        cell.headerLabel.text = formations[indexPath.first ?? 0].first?.uppercased()

        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

extension ControlStripViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        if section == formations.count - 1 {
            // Extend the right inset so the last item in a section can be left aligned when scrolling
            return UIEdgeInsets(top: 12, left: -72, bottom: 0, right: collectionView.bounds.size.width - 36)
        }
        return UIEdgeInsets(top: 12, left: -72, bottom: 0, right: 36)
    }

}
