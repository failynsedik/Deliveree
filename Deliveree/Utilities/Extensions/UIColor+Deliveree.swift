//
//  UIColor+Deliveree.swift
//  Deliveree
//
//  Created by Failyn Sedik on 29/06/2019.
//  Copyright © 2019 Failyn Kaye Sedik. All rights reserved.
//

import UIKit

extension UIColor {
  
  // MARK: - Custom UI Colors
  
  static let delivereeMain: UIColor = UIColor.rgba(r: 237, g: 183, b: 51)
  static let delivereeMainGray: UIColor = UIColor.rgba(r: 31, g: 31, b: 31)
  
  
  // MARK: - Helper Method
  
  static func rgba(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) -> UIColor {
    return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
  }
  
}
