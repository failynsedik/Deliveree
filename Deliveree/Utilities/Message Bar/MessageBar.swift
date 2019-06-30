//
//  MessageBar.swift
//  Deliveree
//
//  Created by Failyn Sedik on 01/07/2019.
//  Copyright © 2019 Failyn Kaye Sedik. All rights reserved.
//

import Foundation

class MessageBar {
  
  static func errorMessage(_ message: String) {
    TWMessageBarManager.sharedInstance().hideAll()
    TWMessageBarManager.sharedInstance().showMessage(
      withTitle: "Error",
      description: message,
      type: TWMessageBarMessageType.error,
      duration: 5
    )
  }
  
}
