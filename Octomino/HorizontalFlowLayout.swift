//
//  HorizontalFlowLayout.swift
//  Octomino
//
//  Created by Michael Sepcot on 9/12/17.
//  Copyright © 2017 Head Down Development. All rights reserved.
//

import UIKit

class HorizontalFlowLayout: UICollectionViewFlowLayout {
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width: itemSize.width, height: itemSize.height)
        if let targetItemAttributes = super.layoutAttributesForElements(in: targetRect) {
            for itemAttributes in targetItemAttributes {
                let firstArg = fabs(proposedContentOffset.x - itemAttributes.frame.origin.x)
                let secondArg = (itemAttributes.frame.size.width + minimumLineSpacing) / 2
                if firstArg < secondArg {
                    return CGPoint(x: itemAttributes.frame.origin.x - minimumLineSpacing, y: proposedContentOffset.y)
                }
            }
        }

        return proposedContentOffset
    }
}
