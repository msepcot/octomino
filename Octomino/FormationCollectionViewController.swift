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

    private let formations = [
        ["Round 1", "G", "22", "F", "1"],
        ["Round 2", "9", "6", "2"],
        ["Round 3", "D", "7", "L", "17"],
        ["Round 4", "8", "J", "C", "K"],
        ["Round 5", "Q", "B", "14", "20"],
        ["Round 6", "19", "15", "4"],
        ["Round 7", "A", "10", "13"],
        ["Round 8", "12", "M", "N", "P"],
        ["Round 9", "H", "O", "3", "16"],
        ["Round 10", "5", "21", "11"],
        ["TB Round", "E", "18", "4"]
    ]

    private var dataSource = [String: [String: String]]()

    override func viewDidLoad() {
        super.viewDidLoad()

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
            for random in randoms {
                if let key = random["Identifier"] {
                    dataSource[key] = random
                }
            }
            blocks = formations["Blocks"]  as! [[String: String]]
            for block in blocks {
                if let key = block["Identifier"] {
                    dataSource[key] = block
                }
            }
        }
    }

// MARK: - UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return formations[section].count - 1
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return formations.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let key = formations[indexPath.section][indexPath.row + 1]
        let formation = dataSource[key] ?? [:]

        let reuseIdentifier = "\(formation["Class"]!)-Identifier"

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FormationCell
        cell.populateCell(dictionary: formation)

        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FormationCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return collectionView.bounds.size
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 0
    }
}
