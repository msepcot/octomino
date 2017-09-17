//
//  FormationCollectionViewController.swift
//  Octomino
//
//  Created by Michael Sepcot on 9/16/17.
//  Copyright © 2017 Head Down Development. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FormationCollectionViewController: UICollectionViewController {
    var randoms: [[String: String]]!
    var blocks:  [[String: String]]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        collectionView?.register(
            UINib(nibName: "OneKeyFormationCell", bundle: nil),
            forCellWithReuseIdentifier: "OneKeyFormationCell-Identifier"
        )

        collectionView?.register(
            UINib(nibName: "TwoKeyFormationCell", bundle: nil),
            forCellWithReuseIdentifier: "TwoKeyFormationCell-Identifier"
        )

        collectionView?.register(
            UINib(nibName: "NotesCell", bundle: nil),
            forCellWithReuseIdentifier: "NotesCell-Identifier"
        )

        // Do any additional setup after loading the view.

        if  let path = Bundle.main.path(forResource: "Formations", ofType: "plist"),
            let formations = NSDictionary(contentsOfFile: path)
        {
            randoms = formations["Randoms"] as! [[String: String]]
            blocks  = formations["Blocks"]  as! [[String: String]]
        }
    }

// MARK: - UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randoms.count + blocks.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let formation: [String: String]!

        if indexPath.row < randoms.count {
            formation = randoms[indexPath.row]
        } else {
            formation = blocks[indexPath.row - randoms.count]
        }

        let reuseIdentifier = "\(formation["Class"]!)-Identifier"

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FormationCell
        cell.populateCell(dictionary: formation)

        return cell
    }

}

// MARK: - UICollectionViewDelegateFlowLayout

extension FormationCollectionViewController: UICollectionViewDelegateFlowLayout {

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
