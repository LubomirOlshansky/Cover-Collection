//
//  FlowLayout.swift
//  Cover Collection
//
//  Created by Lubomir Olshansky on 19/04/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class FlowLayout: UICollectionViewFlowLayout {

    let standardItemScale: CGFloat = 0.8
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        var attributesCopy = [UICollectionViewLayoutAttributes]()
        
        for itemAttributes in attributes! {
            let itemAttributesCopy = itemAttributes.copy() as! UICollectionViewLayoutAttributes
            
            changeLayoutAttributes(itemAttributesCopy)
            attributesCopy.append(itemAttributesCopy)
        }
        
        return attributesCopy
    }
    
    override open func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {

         let collectionViewSize = self.collectionView!.bounds.size
        let proposedContentOffsetCenterX = proposedContentOffset.x + collectionViewSize.width * 0.5
        let insetX = ((collectionView?.bounds.width)! - 300) / 2.0
        let insetY = ((collectionView?.bounds.height)! - 300) / 2.0
        collectionView?.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
        return CGPoint(x: proposedContentOffsetCenterX, y: proposedContentOffset.y)
    }
    
    func changeLayoutAttributes(_ attributes: UICollectionViewLayoutAttributes) {
        let collectionCenter = collectionView!.frame.size.width/2
        let offset = collectionView!.contentOffset.x
        let normalizedCenter = attributes.center.x - offset
        
        let maxDistance = self.itemSize.width + self.minimumLineSpacing
        let distance = min(abs(collectionCenter - normalizedCenter), maxDistance)
        
        let ratio = (maxDistance - distance)/maxDistance
        let scale = ratio * (1 - self.standardItemScale) + self.standardItemScale
        
        attributes.transform3D = CATransform3DScale(CATransform3DIdentity, scale, scale, 1)
    }
}
