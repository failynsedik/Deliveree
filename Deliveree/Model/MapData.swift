//
//  MapData.swift
//  Deliveree
//
//  Created by Failyn Sedik on 30/06/2019.
//  Copyright © 2019 Failyn Kaye Sedik. All rights reserved.
//

import MapKit

class MapData: NSObject, MKAnnotation {

  // MARK: - Properties
  
  var subtitle: String? {
    return deliveryDescription
  }
  
  let title: String?
  let deliveryDescription: String
  let coordinate: CLLocationCoordinate2D
  
  
  // MARK: - Init
  
  init(title: String, deliveryDescription: String, coordinate: CLLocationCoordinate2D) {
    self.title = title
    self.deliveryDescription = deliveryDescription
    self.coordinate = coordinate
    
    super.init()
  }
  
}
