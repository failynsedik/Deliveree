//
//  BaseViewController.swift
//  Deliveree
//
//  Created by Failyn Sedik on 29/06/2019.
//  Copyright © 2019 Failyn Kaye Sedik. All rights reserved.
//

import SnapKit
import UIKit

class BaseViewController: UIViewController {
  
  // MARK: - Properties
  
  private lazy var progressHUD: UIView = {
    let hud = UIView()
    hud.bounds = self.view.bounds
    hud.backgroundColor = UIColor(white: 1, alpha: 0.8)
    
    self.navigationController?.view.addSubview(hud)
    hud.frame.size.height = (self.navigationController?.view.bounds.height)!
    
    hud.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }
    
    let indicatorView = UIActivityIndicatorView()
    indicatorView.tintColor = .delivereeMain
    indicatorView.color = .delivereeMain
    
    hud.addSubview(indicatorView)
    indicatorView.snp.makeConstraints({ (make) in
      make.center.equalToSuperview()
    })
    
    indicatorView.startAnimating()
    
    return hud
  }()
  
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupBase()
    
    if !hasConnectivity() {
      MessageBar.errorMessage("Please check your internet connection.")
    }
  }
  
  
  // MARK: - Functions
  
  func setupBase() {
    
  }
  
  func setupNav() {
    edgesForExtendedLayout = [];
    navigationController?.navigationBar.isTranslucent = false;
  }
  
  /// Begin loading animation
  func startHUD() {
    weak var weakSelf = self
    UIView.animate(withDuration: 0.3) {
      weakSelf?.progressHUD.alpha = 1
    }
  }
  
  /// End loading animation
  func stopHUD() {
    weak var weakSelf = self
    UIView.animate(withDuration: 0.3) {
      weakSelf?.progressHUD.alpha = 0
    }
  }
  
  /// Check if user is connected
  /// to the internet.
  func hasConnectivity() -> Bool {
    let reachability: Reachability = Reachability.forInternetConnection()
    let networkStatus: Int = reachability.currentReachabilityStatus().rawValue
    
    // 0 = NotReachable
    return networkStatus != 0
  }
  
}
