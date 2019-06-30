//
//  UIView+Deliveree.swift
//  Deliveree
//
//  Created by Failyn Sedik on 30/06/2019.
//  Copyright © 2019 Failyn Kaye Sedik. All rights reserved.
//

import UIKit

extension UIView {
  
  func addCornerRadiusWithShadow(
    _ cornerRadius: CGFloat,
    x width: CGFloat,
    y height: CGFloat,
    blur shadowRadius: CGFloat,
    shadowColor: UIColor = .black,
    shadowOpacity: Float
    ) {
    // Set corner radius
    self.layer.cornerRadius = cornerRadius
    
    // Set shadow
    let holderView = UIView(frame: self.frame)
    holderView.backgroundColor = .clear
    self.superview?.addSubview(holderView)
    holderView.center = self.center
    holderView.addSubview(self)
    self.center = CGPoint(x: holderView.frame.size.width / 2.0, y: holderView.frame.size.height / 2.0)
    
    self.layer.masksToBounds = true
    holderView.layer.masksToBounds = false
    
    holderView.layer.shadowColor = shadowColor.cgColor
    holderView.layer.shadowOpacity = shadowOpacity
    holderView.layer.shadowRadius = shadowRadius
    holderView.layer.shadowOffset = CGSize(width: width, height: height)
  }
  
  func addShadow(
    x width: CGFloat,
    y height: CGFloat,
    blur shadowRadius: CGFloat,
    shadowColor: UIColor = .black,
    shadowOpacity: Float
    ) {
    self.layer.shadowColor = shadowColor.cgColor
    self.layer.shadowOpacity = shadowOpacity
    self.layer.shadowRadius = shadowRadius
    self.layer.shadowOffset = CGSize(width: width, height: height)
  }
  
}
