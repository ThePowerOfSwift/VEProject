//
//  VEDRefreshView.swift
//  VietED
//
//  Created by Phung Long on 1/15/16.
//  Copyright © 2016 Phung Long. All rights reserved.
//

import UIKit

class VEDRefreshView: UIRefreshControl {
    let indicatorView :UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectZero)
    var bgView : UIView = UIView(frame: CGRectZero)
    required init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)!
        self.setup()
    }
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.setup()
    }
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }
    
    func setup (){
        bgView.backgroundColor = UIColor.grayColor()
        self.creatIndicatorImage()
        self.translatesAutoresizingMaskIntoConstraints = false
        bgView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bgView)
        bgView.addSubview(indicatorView)
        let views = ["bgView":bgView,"indicator":indicatorView]
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[bgView]|", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[bgView]|", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: views))

        bgView .addConstraint(NSLayoutConstraint(item: indicatorView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: bgView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0))
        bgView.addConstraint(NSLayoutConstraint(item: indicatorView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: bgView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0))
        bgView.addConstraint(NSLayoutConstraint(item: indicatorView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 20))
        bgView.addConstraint(NSLayoutConstraint(item: indicatorView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil
            , attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 20))
        
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = true
        self.backgroundColor = UIColor.whiteColor()
        self.layoutIfNeeded()
    }
    
    func creatIndicatorImage() {
        indicatorView.startAnimating()
    }
    
    func containingScrollViewDidEndDragging(containingScrollView:UIScrollView)->Void {
        let minOffsetToTriggerRefresh : CGFloat = 50.0
        if containingScrollView.contentOffset.y <= -minOffsetToTriggerRefresh {
            self.sendActionsForControlEvents(UIControlEvents.ValueChanged)
        }
        
    }

}
