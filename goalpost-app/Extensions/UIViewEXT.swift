//
//  UIViewEXT.swift
//  goalpost-app
//
//  Created by nopcallowed on 2/2/18.
//  Copyright © 2018 GASHAN INC. All rights reserved.
//

import UIKit

extension UIView {
    func bindToKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillChange), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    @objc func keyBoardWillChange(_ notification: NSNotification) {
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        let startingFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endingFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltaY = endingFrame.origin.y - startingFrame.origin.y
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
    }
}
