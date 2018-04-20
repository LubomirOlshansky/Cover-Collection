//
//  ViewController.swift
//  Cover Collection
//
//  Created by Lubomir Olshansky on 17/04/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {

    var values = Array(0...10)
    let cellScaling:CGFloat = 0.6
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.delegate = self
        
//        let screenSize = UIScreen.main.bounds.size
        let cellHeight:CGFloat = 200.0
        let cellWidth:CGFloat = 200.0
   
        let insetX = (view.bounds.width - cellWidth) / 2.0
        let insetY = (view.bounds.height - cellHeight) / 2.0
        
        let layout = collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)

        collectionView?.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
    }
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
//        guard let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout else {
//            return
//        }
//        flowLayout.invalidateLayout()
//    }
//
}


// MARK: UICollectionViewDataSource
extension CollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return values.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        // Configure the cell

        cell.textLabel.text = String(values[indexPath.row])
        
        return cell
    }
}

extension CollectionViewController
{
    override func  scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
       let layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(index)
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}
