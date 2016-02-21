//
//  VEDGlobalTextField.swift
//  VietED
//
//  Created by Phung Long on 1/6/16.
//  Copyright © 2016 Phung Long. All rights reserved.
//

import UIKit
//#define kPDLoginTextFieldAccessoryViewMaxSide		20

class VEDGlobalTextField: UITextField {

    override func leftViewRectForBounds(bounds: CGRect) -> CGRect {
        if (self.leftView == nil) {
            return CGRectZero;
        }
        let height : CGFloat = bounds.size.height;
        let side : CGFloat = min(height, 20)
        return CGRectMake(bounds.size.width - 5 - side, (height - side) / 2, side, side);
        
    }
    
    override func rightViewRectForBounds(bounds: CGRect) -> CGRect {
        if (self.rightView == nil) {
            return CGRectZero;
        }
        let height : CGFloat = bounds.size.height;
        let side : CGFloat = min(height, 20)
        return CGRectMake(5, (height - side) / 2, side, side);
    }
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        let leftViewWidth : CGFloat  = CGRectGetMaxX(self.leftViewRectForBounds(bounds))
        let rightViewWidth : CGFloat  = self.rightViewRectForBounds(bounds).size.width + 5;
        return CGRectMake(rightViewWidth + 5, 0, bounds.size.width - rightViewWidth - 10 - leftViewWidth, bounds.size.height);

    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        let leftViewWidth : CGFloat  = CGRectGetMaxX(self.leftViewRectForBounds(bounds))
        let rightViewWidth : CGFloat  = self.rightViewRectForBounds(bounds).size.width + 5;
        return CGRectMake(rightViewWidth + 5, 0, bounds.size.width - rightViewWidth - 10 - leftViewWidth, bounds.size.height);
    }
    
    // MARK: setup textfield
    
    func setupLeftViewWithImage (imageName : NSString)->Void {
        let imageView = UIImageView();
        let image = UIImage(named: imageName as String);
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.image = image;
        self.rightViewMode = UITextFieldViewMode.Always
        self.rightView = imageView;
        
    }
}
