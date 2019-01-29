//
//  StretchyHeader.swift
//  Stretchy Header Collection View Cells
//
//  Created by 洪森達 on 2019/1/29.
//  Copyright © 2019 洪森達. All rights reserved.
//

import UIKit

class StretchHeader:UICollectionViewCell {
    
    
    let img:UIImageView = {
        
        let iv = UIImageView(image: #imageLiteral(resourceName: "stretchy_header"))
            iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(img)
        
        img.fillSuperview() 
        setupVisualEffectView()
    }
    
    
    var animator:UIViewPropertyAnimator!
    
    
    fileprivate func setupVisualEffectView(){
        animator = UIViewPropertyAnimator(duration: 3, curve: .linear, animations: {
            [weak self] in
            
            let blurEffect = UIBlurEffect(style: .regular)
            let visualView = UIVisualEffectView(effect: blurEffect)
            
            self?.addSubview(visualView)
            visualView.fillSuperview()
            
        })
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
