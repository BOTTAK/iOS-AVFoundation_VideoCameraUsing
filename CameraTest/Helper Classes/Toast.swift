//
//  Toast.swift
//  CameraTest
//
//  Created by BOTTAK on 11/25/19.
//  Copyright © 2019 Пенькевич Василий. All rights reserved.
//

import Foundation
import UIKit

class OptiToast {
    
    class private func showAlert(backgroundColor:UIColor, textColor:UIColor, message:String)
    {
//        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        var view: UIView!
        let label = UILabel(frame: CGRect.zero)
        label.textAlignment = NSTextAlignment.center
        label.text = message
        label.font = UIFont(name: "Maple-Regular.otf", size: 16) ?? UIFont.systemFont(ofSize: 16)
        label.adjustsFontSizeToFitWidth = true
        
        label.backgroundColor =  backgroundColor
        label.textColor = textColor
        
        label.sizeToFit()
        label.numberOfLines = 4
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = CGSize(width: 4, height: 3)
        label.layer.shadowOpacity = 0.3
        label.frame = CGRect(x: view.window!.frame.size.width, y: 20, width: view.window!.frame.size.width - 3, height: 44)
        
        label.alpha = 1
        
        view.window!.addSubview(label)
        
        var basketTopFrame: CGRect = label.frame;
        basketTopFrame.origin.x = 0;
        
        UIView.animate(withDuration
            :2.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: UIView.AnimationOptions.curveEaseOut, animations: { () -> Void in
                label.frame = basketTopFrame
        },  completion: {
            (value: Bool) in
            UIView.animate(withDuration:2.0, delay: 2.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: UIView.AnimationOptions.curveEaseIn, animations: { () -> Void in
                label.alpha = 0
            },  completion: {
                (value: Bool) in
                label.removeFromSuperview()
            })
        })
    }
    
    class func showPositiveMessage(message:String)
    {
        showAlert(backgroundColor: UIColor.green, textColor: UIColor.white, message: message)
    }
    class func showNegativeMessage(message:String)
    {
        showAlert(backgroundColor: UIColor.red, textColor: UIColor.white, message: message)
    }
}
