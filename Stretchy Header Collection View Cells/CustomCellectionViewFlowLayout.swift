//
//  CustomCellectionViewFlowLayout.swift
//  Stretchy Header Collection View Cells
//
//  Created by 洪森達 on 2019/1/29.
//  Copyright © 2019 洪森達. All rights reserved.
//

import UIKit


class CustomcellectionViewFlowLayout:UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let attributes = super.layoutAttributesForElements(in: rect)
        
        attributes?.forEach({ (attribute) in
            if attribute.representedElementKind ==  UICollectionView.elementKindSectionHeader && attribute.indexPath.section == 0 {
                
                guard let collection = collectionView else {return}
                
                let changedY = collection.contentOffset.y
                
                if changedY > 0 {
                    return
                }
                
                let width = collection.frame.width
                let height = attribute.frame.height - changedY
                attribute.frame = CGRect(x: 0, y: changedY, width: width, height: height)
            }
        })
        
        return attributes
    }

    
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    
    
}
