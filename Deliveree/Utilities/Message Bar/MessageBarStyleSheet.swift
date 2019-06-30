//
//  MessageBarStyleSheet.swift
//  Deliveree
//
//  Created by Failyn Sedik on 01/07/2019.
//  Copyright © 2019 Failyn Kaye Sedik. All rights reserved.
//

import UIKit

class MessageBarStyleSheet: NSObject, TWMessageBarStyleSheet {
  
  // MARK: - Properties
  
  static var shared: MessageBarStyleSheet {
    return MessageBarStyleSheet()
  }
  
  
  // MARK: - Functions
  
  func backgroundColor(for type: TWMessageBarMessageType) -> UIColor {
    return UIColor(white: 0.3, alpha: 1)
  }
  
  func strokeColor(for type: TWMessageBarMessageType) -> UIColor {
    return .delivereeMainGray
  }
  
  func iconImage(for type: TWMessageBarMessageType) -> UIImage {
    return UIImage()
  }
  
  func titleFont(for type: TWMessageBarMessageType) -> UIFont {
    return UIFont.systemFont(ofSize: 14, weight: .bold)
  }
  
  func descriptionFont(for type: TWMessageBarMessageType) -> UIFont {
    return UIFont.systemFont(ofSize: 14)
  }
  
  func titleColor(for type: TWMessageBarMessageType) -> UIColor {
    return .white
  }
  
  func descriptionColor(for type: TWMessageBarMessageType) -> UIColor {
    return .white
  }
  
}
