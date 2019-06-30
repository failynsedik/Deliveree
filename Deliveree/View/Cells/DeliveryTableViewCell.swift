//
//  DeliveryTableViewCell.swift
//  Deliveree
//
//  Created by Failyn Sedik on 29/06/2019.
//  Copyright © 2019 Failyn Kaye Sedik. All rights reserved.
//

import Kingfisher
import SnapKit
import UIKit

class DeliveryTableViewCell: BaseTableViewCell {
  
  // MARK: - Properties
  
  static let height: CGFloat = 100
  private var deliveryListVM = DeliveryListViewModel()
  private var descriptionLabelConstraint: Constraint?
  
  
  // MARK: - View Properties
  
  private lazy var containerView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    return view
  }()
  
  private lazy var receiverImageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    return iv
  }()
  
  private lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 16)
    label.textColor = .delivereeMainGray
    label.numberOfLines = 0
    return label
  }()
  
  
  // MARK: - Setup
  
  func setupCell(delivery: Delivery) {
    deliveryListVM.parse(delivery: delivery)
    
    descriptionLabel.text = deliveryListVM.description
    receiverImageView.kf.indicatorType = .activity
    receiverImageView.kf.setImage(
      with: deliveryListVM.imageResource,
      placeholder: UIImage.deliveree_box,
      options: KingfisherOptionsInfo(arrayLiteral: .transition(.fade(0.3)))
    )
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    
    receiverImageView.addCornerRadiusWithShadow(30, x: 0, y: 5, blur: 7, shadowOpacity: 0.2)
    containerView.addCornerRadiusWithShadow(3, x: 0, y: 2, blur: 3, shadowOpacity: 0.16)
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    addSubview(containerView)
    containerView.snp.makeConstraints { (make) in
      make.top.equalToSuperview().inset(10)
      make.leading.trailing.equalToSuperview().inset(16)
      make.height.equalTo(90)
    }
    
    containerView.addSubview(receiverImageView)
    receiverImageView.snp.makeConstraints { (make) in
      make.width.height.equalTo(60)
      make.centerY.equalToSuperview()
      make.leading.equalToSuperview().inset(16)
    }
    
    containerView.addSubview(descriptionLabel)
    descriptionLabel.snp.makeConstraints { (make) in
      make.centerY.equalToSuperview()
      make.leading.equalTo(receiverImageView.snp.trailing).offset(16)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
