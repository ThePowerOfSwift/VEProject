//
//  VEDAlertView.swift
//  VietED
//
//  Created by Phung Long on 1/18/16.
//  Copyright © 2016 Phung Long. All rights reserved.
//

import UIKit

class VEDAlertView: UIView {
    var messageDialog:UIView = UIView()
    var iconImageView = UIImageView()
    var titleLabel = UILabel()
    var messageLabel = UILabel()
    var keyWindows = UIWindow()
    var yBottom:CGFloat = 0.0
    var autoHidden:Bool = true
    var imageAlert:UIImage = UIImage()
    var titleAlert = String()
    var messageAlert = String()
    var buttonTitles = NSArray()
    init(image : UIImage, title : String, message:String) {
        keyWindows = UIApplication.sharedApplication().keyWindow!
        super.init(frame: keyWindows.frame)
        self.backgroundColor = UIColor(white: 0, alpha: 0.5)
        imageAlert = image
        titleAlert = title
        autoHidden = true
        messageAlert = message
        buttonTitles = ["OK"]
        self.createErrorMessageDialog()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: create interface for Message
    func createErrorMessageDialog(){
        var width = CGRectGetWidth(self.frame) - 50.0
        
        messageDialog = UIView(frame: CGRectMake(25.0, 0, width, 0))
        messageDialog.backgroundColor = UIColor.whiteColor()
        
        iconImageView = UIImageView(frame: CGRectMake(width / 2.0 - 50.0, 34.0, 20.0, 20.0))
        iconImageView.image = imageAlert
        messageDialog.addSubview(iconImageView)
        
        var y  = iconImageView.frame.origin.y
        titleLabel = UILabel(frame: CGRectMake(iconImageView.frame.origin.x + 30.0, y, width, 0))
        titleLabel.text = titleAlert
        titleLabel.textAlignment = NSTextAlignment.Left
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "Helvetica", size: 20.0)
        titleLabel.sizeToFit()
        var labelFrame = titleLabel.frame;
        labelFrame.size.width = width
        titleLabel.frame = labelFrame
        titleLabel.textColor = UIColor.redColor()
        messageDialog.addSubview(titleLabel)
        
        width = CGRectGetWidth(messageDialog.frame) - 80
        y = CGRectGetMaxY(titleLabel.frame) + 14.0
        messageLabel = UILabel(frame: CGRectMake(40.0, y, width, 0))
        messageLabel.text = messageAlert
        messageLabel.numberOfLines = 0
        messageLabel.font = UIFont(name: "Helvetica", size: 16.0)
        messageLabel.sizeToFit()
        messageLabel.textAlignment = NSTextAlignment.Center
        labelFrame = messageLabel.frame
        labelFrame.size.width = width
        messageLabel.frame = labelFrame
        messageLabel.textColor = UIColor.blackColor()
        messageDialog.addSubview(messageLabel)
        
        yBottom = CGRectGetMaxY(messageLabel.frame) + 20.0;

        self.addButtons()
        
        var frame = messageDialog.frame
        frame.size.height = yBottom + 20
        messageDialog.frame = frame
        messageDialog.center = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        
        self.addSubview(messageDialog)
    }
    
    func addButtons() {
        if buttonTitles.count == 0 {
            yBottom += 20
            return
        }
//        var width = CGRectGetWidth(messageDialog.frame)
        if buttonTitles.count == 1 {
            self .creatButton(0)
            return
        }
        
    }
    
    func creatButton(index : Int) {
        let button:UIButton = UIButton(frame: CGRectMake(0, yBottom, 110, 30.0))
        button.center = CGPoint(x: messageDialog.frame.size.width/2.0, y: button.center.y)

        button.backgroundColor = UIColor(red: 142/255.0, green: 193/255.0, blue: 39/255.0, alpha: 1)
        button.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        button.setTitle(buttonTitles[index] as? String, forState: UIControlState.Normal)
        button.tag = index
        button.addTarget(self, action: "", forControlEvents: UIControlEvents.TouchUpInside)
        messageDialog.addSubview(button)
        yBottom += CGRectGetHeight(button.frame)
    }
    // MARK: show and hidden alert
    
    func showAlert() {
        keyWindows .addSubview(self)
        self.transform = CGAffineTransformMakeScale(1.1, 1.1)
        self.alpha = 0.0
        UIView.animateWithDuration(0.5) { () -> Void in
            self.alpha = 1.0
            self.transform = CGAffineTransformMakeScale(1, 1)
        }
        
    }
    
    func hiddenAlert() {
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.transform = CGAffineTransformMakeScale(1.1, 1.1)
            self.alpha = 0.0
            }) { (finished) -> Void in
                if finished {
                    self.removeFromSuperview()
                }
        }
    }
    
    // MARK:Handle Action In View
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if autoHidden {
            self.hiddenAlert()
            
        }
    }

}
