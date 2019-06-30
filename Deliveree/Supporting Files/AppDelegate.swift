//
//  AppDelegate.swift
//  Deliveree
//
//  Created by Failyn Sedik on 28/06/2019.
//  Copyright © 2019 Failyn Kaye Sedik. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  // MARK: - AppDelegate Functions
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    setup()
    
    return true
  }
  
  // MARK: - Private Functions
  
  private func setup() {
    setupNavBar()
    setupInitialVC()
    setupMessageBar()
  }
  
  private func setupNavBar() {
    let navBarAppearance = UINavigationBar.appearance()
    navBarAppearance.tintColor = .white
    navBarAppearance.barTintColor = .delivereeMain
    navBarAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    navBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    
    let barButtomItemAppearance = UIBarButtonItem.appearance()
    barButtomItemAppearance.setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .normal)
  }
  
  private func setupInitialVC() {
    let deliveryListVC = DeliveryListViewController()
    let navController = UINavigationController(rootViewController: deliveryListVC)
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.rootViewController = navController
  }
  
  private func setupMessageBar() {
    TWMessageBarManager.sharedInstance().styleSheet = MessageBarStyleSheet.shared
  }
  
}
