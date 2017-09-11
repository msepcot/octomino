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

class ControlStripViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UINib(nibName: "ControlStripCell", bundle: nil),
                                      forCellWithReuseIdentifier: cellIdentifier)
        self.collectionView!.register(UINib(nibName: "ControlStripHeader", bundle: nil),
                                      forSupplementaryViewOfKind: "header",
                                      withReuseIdentifier: headerIdentifier)

        // Adjust flow layout sizing
        let flowLayout = self.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.headerReferenceSize = CGSize(width: 72, height: 12)
        flowLayout.sectionHeadersPinToVisibleBounds = true

        flowLayout.sectionInset = UIEdgeInsets(top: 12, left: -72, bottom: 0, right: 0)

        flowLayout.footerReferenceSize = CGSize(width: 72, height: 12)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        // #warning Incomplete implementation, return the number of sections
        return 3
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 7
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ControlStripCell
    
        // Configure the cell
        cell.formationLabel.text = "\(indexPath.last ?? -1)"
    
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: "header", withReuseIdentifier: headerIdentifier, for: indexPath) as! ControlStripHeader

        // Configure the cell
        cell.headerLabel.text = "TESTING \(indexPath.first ?? -1)"

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
