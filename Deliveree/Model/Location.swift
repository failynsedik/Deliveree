//
//  Location.swift
//  Deliveree
//
//  Created by Failyn Sedik on 29/06/2019.
//  Copyright © 2019 Failyn Kaye Sedik. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Location {
  
  // MARK: - Properties
  
  var lat: Double?
  var lng: Double?
  var address: String?
  
  init(json: JSON) {
    if let lat = json["lat"].rawValue as? Double { self.lat = lat }
    if let lng = json["lng"].rawValue as? Double { self.lng = lng }
    if let address = json["address"].rawValue as? String { self.address = address }
  }
  
}
