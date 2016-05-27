//
//  BadgeView.swift
//  GA_BadgeView
//
//  Created by houjianan on 16/5/27.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit
//self.view.showBadgeView(rectOfBadgeView: CGRectMake(100, 100, 10, 10))
extension UIView {

    private struct AssociatedKeys {
        static var fontSize = 12
        static var badgeLabelKey: UInt = 1
        static var badgeLabelFontKey: UInt = 2
        static var badgeLabelColorKey: UInt = 3
        static var badgeLabelTextColorKey: UInt = 4
        static var badgeLabelFrameKey: UInt = 5
        static var badgeLabelValueKey: UInt = 6
    }
    
    public func showBadgeView(value: String = "", rectOfBadgeView rect: CGRect, backgroundColor: UIColor = UIColor.redColor(), textColor: UIColor = UIColor.whiteColor(), font: UIFont = UIFont.boldSystemFontOfSize(12)) {
        if value == "" || value == "0"{
            showRedDotBadge()
        } else {
            showNumbserBadgeLabel(value: value)
        }
        self.badgeLabelFrame = rect
        self.badgeLabelColor = backgroundColor
        self.badgeLabelTextColor = textColor
        self.badgeLabelFont = font
    }
    
    private func showRedDotBadge() {
        initBadgeLabel()
        self.badgeLabel.text = ""
    }
    
    private func showNumbserBadgeLabel(value value: String) {
        initBadgeLabel()
        self.badgeLabel.text = self.badgeLabelValue
        self.badgeLabelValue = Int(value) >= 99 ? "99+" : value
    }
    
    private func initBadgeLabel() {
        var once: dispatch_once_t = 0
        dispatch_once(&once, {
            self.badgeLabel = UILabel()
            self.addSubview(self.badgeLabel)
            self.badgeLabel.textAlignment = .Center
            self.badgeLabel.layer.masksToBounds = true
            self.badgeLabel.hidden = false
        })
    }
   
    func clearBadge() {
        self.badgeLabel.hidden = true
    }
    
    var badgeLabel: UILabel {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.badgeLabelKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.badgeLabelKey) as! UILabel
        }
    }
    
    var badgeLabelFont: UIFont? {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.badgeLabelFontKey, newValue, .OBJC_ASSOCIATION_RETAIN)
            self.badgeLabel.font = newValue == nil ? UIFont.boldSystemFontOfSize(12) : newValue
        }
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.badgeLabelFontKey) as? UIFont
        }
    }
    
    var badgeLabelColor: UIColor? {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.badgeLabelColorKey, newValue, .OBJC_ASSOCIATION_RETAIN)
            print(newValue)
            self.badgeLabel.backgroundColor = newValue
        }
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.badgeLabelColorKey) as? UIColor
        }
    }
    
    var badgeLabelTextColor: UIColor? {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.badgeLabelTextColorKey, newValue, .OBJC_ASSOCIATION_RETAIN)
            self.badgeLabel.textColor = newValue
        }
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.badgeLabelTextColorKey) as? UIColor
        }
    }
    
    var badgeLabelFrame: CGRect? {
        set {
            let x: CGFloat = newValue!.origin.x
            let y: CGFloat = newValue!.origin.y
            let w: CGFloat = newValue!.size.width
            let h: CGFloat = newValue!.size.height
            let dic = ["x" : x, "y" : y, "width" : w, "height" : h]
            objc_setAssociatedObject(self, &AssociatedKeys.badgeLabelTextColorKey, dic, .OBJC_ASSOCIATION_RETAIN)
            self.badgeLabel.frame = newValue!
            self.badgeLabel.layer.cornerRadius = newValue!.size.width / 2
        }
        get {
            let obj = objc_getAssociatedObject(self, &AssociatedKeys.badgeLabelTextColorKey)
            if obj != nil && obj.isKindOfClass(NSDictionary) && obj.count == 4 {
                let x: CGFloat = obj["x"] as! CGFloat
                let y: CGFloat = obj["y"] as! CGFloat
                let w: CGFloat = obj["width"] as! CGFloat
                let h: CGFloat = obj["height"] as! CGFloat
                return CGRectMake(x, y, w, h)
            } else {
                return  CGRectZero
            }
        }
    }
    
    var badgeLabelValue: String? {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.badgeLabelValueKey, newValue, .OBJC_ASSOCIATION_RETAIN)
            self.badgeLabel.text = newValue
        }
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.badgeLabelValueKey) as? String
        }
    }
    
    

}


