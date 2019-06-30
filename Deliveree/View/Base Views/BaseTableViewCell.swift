//
//  BaseTableViewCell.swift
//  Deliveree
//
//  Created by Failyn Sedik on 29/06/2019.
//  Copyright © 2019 Failyn Kaye Sedik. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
  
  // MARK: - Properties
  
  static var reuseIdentifier: String {
    return NSStringFromClass(self)
  }
  
  
  // MARK: - Functions
  
  
  // MARK: - Overrides
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    self.selectionStyle = .none
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
