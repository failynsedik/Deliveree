//
//  DeliveryListViewModel.swift
//  Deliveree
//
//  Created by Failyn Sedik on 29/06/2019.
//  Copyright © 2019 Failyn Kaye Sedik. All rights reserved.
//

import Foundation
import Kingfisher
import SwiftyJSON

class DeliveryListViewModel {
  
  // MARK: - Properties
  
  var deliveryCount: Int {
    return deliveries.count
  }
  
  var jsonObjArray: [JSON] = [] {
    didSet {
      parseJSONArray()
    }
  }
  
  var deliveries: [Delivery] = [Delivery]()
  var description: String = ""
  var address: String = ""
  var imageResource: ImageResource?
  
  
  // MARK: - Functions
  
  private func parseJSONArray() {
    for json in jsonObjArray {
      let delivery = Delivery(json: json)
      deliveries.append(delivery)
    }
  }
  
  func parse(delivery: Delivery) {
    parseAddress(delivery: delivery)
    parseDescription(delivery: delivery)
    parseImageSource(delivery: delivery)
  }
  
  private func parseDescription(delivery: Delivery) {
    if let description = delivery.description {
      self.description = description
    } else {
      self.description = "Unavaible"
    }
  }
  
  private func parseAddress(delivery: Delivery) {
    if let loc = delivery.location, let address = loc.address {
      self.address = address
    } else {
      self.address = "Unavaible"
    }
  }
  
  private func parseImageSource(delivery: Delivery) {
    if let urlString = delivery.imageUrl, let url = URL(string: urlString) {
      imageResource = ImageResource(downloadURL: url, cacheKey: url.absoluteString)
    }
  }
  
}
