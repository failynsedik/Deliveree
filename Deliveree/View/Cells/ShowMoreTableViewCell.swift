//
//  ShowMoreTableViewCell.swift
//  Deliveree
//
//  Created by Failyn Sedik on 01/07/2019.
//  Copyright © 2019 Failyn Kaye Sedik. All rights reserved.
//

import SnapKit
import UIKit

class ShowMoreTableViewCell: BaseTableViewCell {

  // MARK: - Properties
  
  static let height: CGFloat = 60
  
  
  // MARK: - View Properties
  
  private lazy var showMoreLabel: UILabel = {
    let label = UILabel()
    label.text = "Show More"
    label.font = UIFont.systemFont(ofSize: 16)
    label.textColor = .delivereeMain
    label.numberOfLines = 1
    return label
  }()
  
  
  // MARK: - Setup Views
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    showMoreLabel.addShadow(x: 0, y: 2, blur: 5, shadowOpacity: 0.16)
    
    addSubview(showMoreLabel)
    showMoreLabel.snp.makeConstraints { (make) in
      make.center.equalToSuperview()
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
