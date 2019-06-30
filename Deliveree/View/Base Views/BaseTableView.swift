//
//  BaseTableView.swift
//  Deliveree
//
//  Created by Failyn Sedik on 29/06/2019.
//  Copyright © 2019 Failyn Kaye Sedik. All rights reserved.
//

import UIKit

protocol BaseTableViewDelegate: class {
  func baseTableViewShouldRegisterCell(tv: BaseTableView)
}

class BaseTableView: UITableView {
  
  // MARK: - Properties
  
  weak var baseDelegate: BaseTableViewDelegate?
  
  // MARK: - Overrides
  
  override init(frame: CGRect, style: UITableView.Style) {
    super.init(frame: frame, style: style)
    
    self.showsVerticalScrollIndicator = false
    
    let clearView = UIView()
    clearView.backgroundColor = .clear
    self.tableHeaderView = clearView
    self.tableFooterView = clearView
    
    self.keyboardDismissMode = .interactive
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func didMoveToWindow() {
    baseDelegate?.baseTableViewShouldRegisterCell(tv: self)
    
    super.didMoveToWindow()
  }
  
}
