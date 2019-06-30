//
//  DeliveryListViewController.swift
//  Deliveree
//
//  Created by Failyn Sedik on 28/06/2019.
//  Copyright © 2019 Failyn Kaye Sedik. All rights reserved.
//

import Moya
import SnapKit
import SwiftyJSON
import UIKit

class DeliveryListViewController: BaseViewController {
  
  // MARK: - Data Properties
  
  private var deliveryListVM = DeliveryListViewModel()
  private var limit: Int = 20
  private var offset: Int = 0
  private var shouldShowMore: Bool = false
  
  
  // MARK: - Lazy Vars
  
  private lazy var deliveryTableView: BaseTableView = {
    let tv = BaseTableView(frame: .zero, style: .plain)
    tv.delegate = self
    tv.dataSource = self
    tv.baseDelegate = self
    tv.separatorStyle = .none
    return tv
  }()
  
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
  
  // MARK: - Functions
  // MARK: Setup
  
  private func setup() {
    setupViews()
    getData()
  }
  
  private func setupViews() {
    setupNav()
    
    view.backgroundColor = .white
    
    view.addSubview(deliveryTableView)
    deliveryTableView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }
  }
  
  override func setupNav() {
    super.setupNav()
    
    navigationController?.navigationBar.prefersLargeTitles = true
    title = "Delivery List"
  }
  
  // MARK: Update
  
  private func updateOffset() {
    offset = offset + 20
  }
  
  private func reloadTableView() {
    let contentOffset: CGPoint = deliveryTableView.contentOffset
    deliveryTableView.reloadData()
    deliveryTableView.layoutIfNeeded()
    deliveryTableView.setContentOffset(contentOffset, animated: false)
  }
  
}


// MARK: - API Call

extension DeliveryListViewController {
  func getData() {
    getDeliveries()
  }
  
  func getDeliveries() {
    weak var weakSelf = self
    
    self.startHUD()
    deliveryProvider.request(.getDeliveries(offset: offset, limit: limit)) { result in
      self.stopHUD()
      
      switch result {
      case let .success(moyaResponse):
        if moyaResponse.statusCode == 200 {
          let jsonObj = JSON(moyaResponse.data)
          
          if let jsonObjArray = jsonObj.array {
            weakSelf?.deliveryListVM.jsonObjArray = jsonObjArray
          }
          
          weakSelf?.reloadTableView()
          weakSelf?.updateOffset()
          weakSelf?.checkForNextPage()
        } else {
          MessageBar.errorMessage("Could not connect to the server. Please try again later.")
        }
        
        // End of success
        
      case let .failure(error):
        MessageBar.errorMessage(error.localizedDescription)
        
        // End of failure
      }
      
      // End of request
    }
  }
    
  func checkForNextPage() {
    weak var weakSelf = self
    
    deliveryProvider.request(.getDeliveries(offset: offset, limit: limit)) { result in
      switch result {
      case let .success(moyaResponse):
        if moyaResponse.statusCode == 200 {
          let jsonObj = JSON(moyaResponse.data)
          
          if let jsonObjArray = jsonObj.array, jsonObjArray.count > 0 {
            weakSelf?.shouldShowMore = true
          } else {
            weakSelf?.shouldShowMore = false
          }
        } else {
          weakSelf?.shouldShowMore = false
        }
        
        weakSelf?.reloadTableView()
        
        // End of success
        
      case .failure:
        weakSelf?.shouldShowMore = false
        weakSelf?.reloadTableView()
        
        // End of failure
      }
      
      // End of request
    }
  }
  
}


// MARK: - Delegates
// MARK: UITableViewDelegate

extension DeliveryListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if shouldShowMore && indexPath.row == deliveryListVM.deliveryCount {
      getDeliveries()
    } else {
      let deliveryDetailVC = DeliveryDetailViewController()
      deliveryDetailVC.setupData(delivery: deliveryListVM.deliveries[indexPath.row])
      self.navigationController?.pushViewController(deliveryDetailVC, animated: true)
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if shouldShowMore && indexPath.row == deliveryListVM.deliveryCount {
      return ShowMoreTableViewCell.height
    }
    
    return DeliveryTableViewCell.height
  }
}

// MARK: UITableViewDataSource

extension DeliveryListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if shouldShowMore {
      return deliveryListVM.deliveryCount + 1
    }
    
    return deliveryListVM.deliveryCount
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if shouldShowMore && indexPath.row == deliveryListVM.deliveryCount {
      return showMoreTableViewCell()
    }
    
    return deliveryTableViewCell(at: indexPath)
  }
  
  private func deliveryTableViewCell(at indexPath: IndexPath) -> UITableViewCell {
    guard let cell = deliveryTableView.dequeueReusableCell(withIdentifier: DeliveryTableViewCell.reuseIdentifier) as? DeliveryTableViewCell else { return UITableViewCell() }
    cell.setupCell(delivery: deliveryListVM.deliveries[indexPath.row])
    return cell
  }
  
  private func showMoreTableViewCell() -> UITableViewCell {
    guard let cell = deliveryTableView.dequeueReusableCell(withIdentifier: ShowMoreTableViewCell.reuseIdentifier) as? ShowMoreTableViewCell else { return UITableViewCell() }
    return cell
  }
  
}


// MARK: - Custom Delegates
// MARK: BaseTableViewDelegate

extension DeliveryListViewController: BaseTableViewDelegate {
  func baseTableViewShouldRegisterCell(tv: BaseTableView) {
    tv.register(DeliveryTableViewCell.self, forCellReuseIdentifier: DeliveryTableViewCell.reuseIdentifier)
    tv.register(ShowMoreTableViewCell.self, forCellReuseIdentifier: ShowMoreTableViewCell.reuseIdentifier)
  }
}
