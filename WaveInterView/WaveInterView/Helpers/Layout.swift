//
//  Layout.swift
//
//  Created by ZefengQiu on 2016-04-10.
//

import UIKit


/**
 
 the Purpose of this class to add some basic layout programmatically, to view in its superview or to itself
 
 */


@objc class Layout: NSObject {
  
  /**
   layout item in center of its super view
   
   - parameter bar:
   
   - item: UIView -- the UIView or its subclass that is required to be layout.
   - view: UIView? -- optional (view.addSubview(item)).
   
   - returns: void
   */
  
  static func itemInCenterOfItsSuperView(item: UIView, view: UIView?) {
    if let superView = view {
      NSLayoutConstraint(item: item, attribute: .centerX, relatedBy: .equal, toItem: superView, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
      NSLayoutConstraint(item: item, attribute: .centerY, relatedBy: .equal, toItem: superView, attribute: .centerY, multiplier: 1.0, constant: 0.0).isActive = true
    }else {
      let superView = item.superview
      NSLayoutConstraint(item: item, attribute: .centerX, relatedBy: .equal, toItem: superView, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
      NSLayoutConstraint(item: item, attribute: .centerY, relatedBy: .equal, toItem: superView, attribute: .centerY, multiplier: 1.0, constant: 0.0).isActive = true
    }
  }
  
  
  
  /**
   layout item with padding around
   
   - parameter bar:
   
   - item: UIView -- the UIView or its subclass that is required to be layout.
   - superView: UIView -- item's superview (view.addSubview(item)).
   - padding: CGFloat -- distance to item's superview.
   
   - returns: void
   */
  
  static func itemWithSamePaddingAroundInSuperView(item: UIView, superView: UIView, padding: CGFloat) {
    NSLayoutConstraint(item: item, attribute: .left, relatedBy: .equal, toItem: superView, attribute: .left, multiplier: 1.0, constant: padding).isActive = true
    NSLayoutConstraint(item: item, attribute: .right, relatedBy: .equal, toItem: superView, attribute: .right, multiplier: 1.0, constant: -padding).isActive = true
    NSLayoutConstraint(item: item, attribute: .top, relatedBy: .equal, toItem: superView, attribute: .top, multiplier: 1.0, constant: padding).isActive = true
    NSLayoutConstraint(item: item, attribute: .bottom, relatedBy: .equal, toItem: superView, attribute: .bottom, multiplier: 1.0, constant: -padding).isActive = true
  }
  
  
  /**
   layout item with left and right padding around
   
   - parameter bar: item:
   
   - UIView -- the UIView or its subclass that is required to be layout
   - superView: UIView -- item's superview (view.addSubview(item))
   - padding: CGFloat -- left and right distance to item's superview
   
   - returns: void
   */
  
  static func itemWithSameLeftRightArroundInSuperView(item: UIView, toView: UIView, padding: CGFloat) {
    NSLayoutConstraint(item: item, attribute: .left, relatedBy: .equal, toItem: toView, attribute: .left, multiplier: 1.0, constant: padding).isActive = true
    NSLayoutConstraint(item: item, attribute: .right, relatedBy: .equal, toItem: toView, attribute: .right, multiplier: 1.0, constant: -padding).isActive = true
  }
  
  
  /**
   layout item with left and right padding around
   
   - parameter bar: item:
   
   - UIView -- the UIView or its subclass that is required to be layout
   - superView: UIView -- item's superview (view.addSubview(item))
   - padding: CGFloat -- left and right distance to item's superview
   
   - returns: void
   */
  
  static func itemWithSameTopBottomArroundInSuperView(item: UIView, toView: UIView, padding: CGFloat) {
    NSLayoutConstraint(item: item, attribute: .top, relatedBy: .equal, toItem: toView, attribute: .top, multiplier: 1.0, constant: padding).isActive = true
    NSLayoutConstraint(item: item, attribute: .bottom, relatedBy: .equal, toItem: toView, attribute: .bottom, multiplier: 1.0, constant: -padding).isActive = true
  }
  
  
  /**
   layout item with setting its height and width
   
   - parameter bar:
   
   - item: UIView -- the UIView or its subclass that is required to be layout
   - height: CGFloat -- item's height
   - width: CGFloat -- item's width
   
   - returns: void
   */
  
  static func settingItemWidthHeight(item: UIView, width: CGFloat, height: CGFloat) {
    NSLayoutConstraint(item: item, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: width).isActive = true
    NSLayoutConstraint(item: item, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: height).isActive = true
  }
  
  
}

