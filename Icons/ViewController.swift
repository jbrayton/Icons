//
//  ViewController.swift
//  Icons
//
//  Created by John Brayton on 1/8/23.
//

import UIKit

/*
    This class does nothing to update the view if the current icon is set from another view controller (on iPad).
 */
class ViewController: UICollectionViewController {

    var currentIconIndexPath: IndexPath {
        let appIconIdentifier = UIApplication.shared.alternateIconName ?? JBIconVariation.primaryIconIdentifier
        var rowNumber = 0
        for (i, iconVariation) in JBIconVariation.allVariations.enumerated() {
            if iconVariation.identifier == appIconIdentifier {
                rowNumber = i
                break
            }
        }
        return IndexPath(item: rowNumber, section: 0)
    }

    init() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        let isIpad = UIDevice.current.userInterfaceIdiom == .pad
        collectionViewLayout.scrollDirection = .vertical
        let iconSize: CGFloat = isIpad ? 83.5 : 60
        let cellSize = (IconCell.borderWidth * 2) + iconSize
        collectionViewLayout.minimumLineSpacing = isIpad ? iconSize : 16.0
        collectionViewLayout.minimumInteritemSpacing = isIpad ? iconSize : 16.0
        collectionViewLayout.itemSize = CGSize(width: cellSize, height: cellSize)
        super.init(collectionViewLayout: collectionViewLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Icons"
        self.view.backgroundColor = .white

        self.resetCollectionViewLayout()
        self.collectionView.allowsFocus = true
        self.collectionView.contentInsetAdjustmentBehavior = .always
        self.collectionView.register(IconCell.self, forCellWithReuseIdentifier: "cell")
        self.collectionView?.isHidden = false
    }

    override func viewDidAppear(_ animated: Bool) {
        let indexPath = self.currentIconIndexPath
        self.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredVertically)
        self.collectionView.cellForItem(at: indexPath)?.setNeedsDisplay()
        self.collectionView.becomeFirstResponder()
    }
    
    func resetCollectionViewLayout() {
        let isIpad = UIDevice.current.userInterfaceIdiom == .pad
        let iconSize: CGFloat = isIpad ? 83.5 : 60
        let cellSize = (IconCell.borderWidth * 2) + iconSize
        let spaceBetween = isIpad ? iconSize : 16.0
        
        let collectionViewLayout: UICollectionViewFlowLayout!
        if isIpad {
            collectionViewLayout = UICollectionViewFlowLayout()
        } else {
            collectionViewLayout = ColumnFlowLayout(cellsPerRow: 4)
        }
        collectionViewLayout.scrollDirection = .vertical
        if isIpad {
            collectionViewLayout.minimumLineSpacing = spaceBetween
            collectionViewLayout.minimumInteritemSpacing = spaceBetween
        }
        collectionViewLayout.itemSize = CGSize(width: cellSize, height: cellSize)
        
        let sideMargin = max(self.view.safeAreaInsets.left, self.view.safeAreaInsets.right, 16.0)
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 16, left: sideMargin, bottom: 16, right: sideMargin)
        self.collectionView.setCollectionViewLayout(collectionViewLayout, animated: false)
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return JBIconVariation.allVariations.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! IconCell
        cell.iconVariation = JBIconVariation.allVariations[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let variation = JBIconVariation.allVariations[indexPath.item]
        collectionView.cellForItem(at: indexPath)?.setNeedsDisplay()
        if variation.identifier == JBIconVariation.primaryIconIdentifier {
            UIApplication.shared.setAlternateIconName(nil)
        } else {
            UIApplication.shared.setAlternateIconName(variation.identifier)
        }
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if let prevView = context.previouslyFocusedView {
            prevView.setNeedsDisplay()
        }
        if let newView = context.nextFocusedView {
            newView.setNeedsDisplay()
        }
    }
    
    override func indexPathForPreferredFocusedView(in collectionView: UICollectionView) -> IndexPath? {
        let result = self.currentIconIndexPath
        return result
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.setNeedsDisplay()
    }
    
}

