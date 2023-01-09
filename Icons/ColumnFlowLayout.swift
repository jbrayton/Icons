//
//  ColumnFlowLayout.swift
//  Icons
//
//  Created by John Brayton on 1/8/23.
//

import UIKit

/*
    For the iPhone, make sure there are always exactly four items per row when in portrait mode.
    Adapted from https://stackoverflow.com/questions/14674986/uicollectionview-set-number-of-columns
 */
class ColumnFlowLayout: UICollectionViewFlowLayout {

    let cellsPerRow: Int

    init(cellsPerRow: Int) {
        self.cellsPerRow = cellsPerRow
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepare() {
        super.prepare()

        guard let collectionView = collectionView else { return }
        
        if collectionView.bounds.size.width < collectionView.bounds.size.height {
            let usedByCells: CGFloat = CGFloat(self.cellsPerRow) * self.itemSize.width
            let numBetween: CGFloat = CGFloat(self.cellsPerRow - 1)
            self.minimumInteritemSpacing = floor((collectionView.bounds.size.width - sectionInset.left - sectionInset.right - usedByCells)/numBetween)
        } else {
            self.minimumInteritemSpacing = 16.0
        }
        self.minimumLineSpacing = self.minimumInteritemSpacing
    }

    override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
        let context = super.invalidationContext(forBoundsChange: newBounds) as! UICollectionViewFlowLayoutInvalidationContext
        context.invalidateFlowLayoutDelegateMetrics = newBounds.size != collectionView?.bounds.size
        return context
    }

}
