//
//  DeliveryDetailViewModel.swift
//  Deliveree
//
//  Created by Failyn Sedik on 30/06/2019.
//  Copyright © 2019 Failyn Kaye Sedik. All rights reserved.
//

import Foundation
import Kingfisher
import MapKit

class DeliveryDetailViewModel {
  
  // MARK: - Properties
  
  var delivery = Delivery()
  var address: String = ""
  var coordinateRegion = MKCoordinateRegion()
  var description: String = ""
  var imageResource: ImageResource?
  var location = CLLocation()
  var mapData: MapData!
  var span = MKCoordinateSpan()
  
  
  // MARK: - Functions
  
  func parse() {
    parseAddress()
    parseLocation()
    parseCoordinateRegion()
    parseDescription()
    parseImageSource()
    setupMapData()
  }
  
  private func parseAddress() {
    if let loc = delivery.location, let address = loc.address {
      self.address = address
    } else {
      self.address = "Unavaible"
    }
  }
  
  private func parseLocation() {
    if let loc = delivery.location, let lat = loc.lat, let lng = loc.lng {
      location = CLLocation(latitude: lat, longitude: lng)
    } else {
      // Default
      location = CLLocation(latitude: 12.8797, longitude: 121.7740)
    }
  }
  
  private func parseCoordinateRegion() {
    span = MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: 0)
    coordinateRegion = MKCoordinateRegion(center: location.coordinate, span: span)
    
    setupMapData()
  }
  
  private func parseDescription() {
    if let description = delivery.description {
      self.description = description
    } else {
      self.description = "Unavaible"
    }
  }
  
  private func parseImageSource() {
    if let urlString = delivery.imageUrl, let url = URL(string: urlString) {
      imageResource = ImageResource(downloadURL: url, cacheKey: url.absoluteString)
    }
  }
  
  private func setupMapData() {
    mapData = MapData(
      title: address,
      deliveryDescription: "\(location.coordinate.latitude), \(location.coordinate.longitude)",
      coordinate: location.coordinate
    )
  }
  
}
