//
//  DeliveryDetailViewController.swift
//  Deliveree
//
//  Created by Failyn Sedik on 30/06/2019.
//  Copyright © 2019 Failyn Kaye Sedik. All rights reserved.
//

import Kingfisher
import MapKit
import SnapKit
import UIKit

class DeliveryDetailViewController: BaseViewController {
  
  // MARK: - Properties
  
  private var deliveryDetailVM = DeliveryDetailViewModel()
  
  
  // MARK: - View Properties
  
  private lazy var mapView: MKMapView = {
    let mapView = MKMapView()
    return mapView
  }()
  
  private lazy var detailView: UIView = {
    let detailView = UIView()
    detailView.backgroundColor = .white
    detailView.alpha = 0.8
    return detailView
  }()
  
  private lazy var receiverImageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    return iv
  }()
  
  private lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    label.textColor = .delivereeMain
    label.numberOfLines = 1
    return label
  }()
  
  private lazy var addressLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 14)
    label.textColor = .delivereeMainGray
    label.numberOfLines = 1
    return label
  }()
  
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    detailView.addShadow(x: 0, y: -3, blur: 2, shadowOpacity: 0.16)
    receiverImageView.addCornerRadiusWithShadow(
      30,
      x: 0,
      y: 5,
      blur: 7,
      shadowOpacity: 0.2
    )
  }
  
  
  // MARK: - Functions
  // MARK: Setup
  
  func setupData(delivery: Delivery) {
    deliveryDetailVM.delivery = delivery
    deliveryDetailVM.parse()
  }
  
  private func setup() {
    setupNav()
    setupViews()
  }
  
  private func setupViews() {
    view.backgroundColor = .white
    
    view.addSubview(detailView)
    detailView.snp.makeConstraints { (make) in
      make.height.equalTo(100)
      make.leading.trailing.equalToSuperview()
      make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
    }
    
    view.addSubview(mapView)
    mapView.snp.makeConstraints { (make) in
      make.top.leading.trailing.equalToSuperview()
      make.bottom.equalTo(detailView.snp.top)
    }
    
    detailView.addSubview(receiverImageView)
    receiverImageView.snp.makeConstraints { (make) in
      make.width.height.equalTo(60)
      make.centerY.equalToSuperview()
      make.leading.equalToSuperview().inset(16)
    }
    
    detailView.addSubview(descriptionLabel)
    descriptionLabel.snp.makeConstraints { (make) in
      make.top.equalTo(receiverImageView)
      make.leading.equalTo(receiverImageView.snp.trailing).offset(16)
      make.trailing.equalToSuperview().inset(16)
    }
    
    detailView.addSubview(addressLabel)
    addressLabel.snp.makeConstraints { (make) in
      make.top.equalTo(descriptionLabel.snp.bottom).offset(3)
      make.leading.trailing.equalTo(descriptionLabel)
    }
    
    UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
      self.detailView.alpha = 0.8
    }) { _ in
      self.view.addSubview(self.detailView)
    }
    
    setupMapView()
    setupOtherDetails()
  }
  
  override func setupNav() {
    navigationItem.largeTitleDisplayMode = .never
    title = "Delivery Details"
  }
  
  private func setupMapView() {
    mapView.setRegion(deliveryDetailVM.coordinateRegion, animated: true)
    mapView.addAnnotation(deliveryDetailVM.mapData)
  }
  
  private func setupOtherDetails() {
    descriptionLabel.text = deliveryDetailVM.description
    addressLabel.text = deliveryDetailVM.address
    
    receiverImageView.kf.indicatorType = .activity
    receiverImageView.kf.setImage(
      with: deliveryDetailVM.imageResource,
      placeholder: UIImage.deliveree_box,
      options: KingfisherOptionsInfo(arrayLiteral: .transition(.fade(0.3)))
    )
  }
  
}
