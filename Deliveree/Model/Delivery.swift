//
//  Delivery.swift
//  Deliveree
//
//  Created by Failyn Sedik on 29/06/2019.
//  Copyright © 2019 Failyn Kaye Sedik. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Delivery {
  
  // MARK: - Properties
  
  var id: Int?
  var description: String?
  var imageUrl: String?
  var location: Location?
  
}

extension Delivery {
  
  init(json: JSON) {
    if let id = json["id"].rawValue as? Int { self.id = id }
    if let description = json["description"].rawValue as? String { self.description = description }
    if let imageUrl = json["imageUrl"].rawValue as? String { self.imageUrl = imageUrl }
    self.location = Location(json: json["location"])
  }
  
}


/*
[
 {
 "description" : "Deliver documents to Andrio",
 "location" : {
 "lng" : 114.170008,
 "lat" : 22.319181,
 "address" : "Mong Kok"
 },
 "imageUrl" : "https:\/\/s3-ap-southeast-1.amazonaws.com\/lalamove-mock-api\/images\/pet-5.jpeg",
 "id" : 0
 },
 {
 "imageUrl" : "https:\/\/s3-ap-southeast-1.amazonaws.com\/lalamove-mock-api\/images\/pet-4.jpeg",
 "id" : 1,
 "description" : "Deliver documents to Andrio",
 "location" : {
 "lng" : 114.170008,
 "lat" : 22.319181,
 "address" : "Mong Kok"
 }
 },
 {
 "imageUrl" : "https:\/\/s3-ap-southeast-1.amazonaws.com\/lalamove-mock-api\/images\/pet-2.jpeg",
 "id" : 2,
 "description" : "Deliver wine to Kenneth",
 "location" : {
 "lng" : 114.155288,
 "lat" : 22.336093000000002,
 "address" : "Cheung Sha Wan"
 }
 },
 {
 "imageUrl" : "https:\/\/s3-ap-southeast-1.amazonaws.com\/lalamove-mock-api\/images\/pet-1.jpeg",
 "id" : 3,
 "description" : "Deliver documents to Andrio",
 "location" : {
 "lng" : 114.176169,
 "lat" : 22.335538,
 "address" : "Kowloon Tong"
 }
 },
 {
 "imageUrl" : "https:\/\/s3-ap-southeast-1.amazonaws.com\/lalamove-mock-api\/images\/pet-1.jpeg",
 "id" : 4,
 "description" : "Deliver toys to Luqman",
 "location" : {
 "lng" : 114.176169,
 "lat" : 22.335538,
 "address" : "Kowloon Tong"
 }
 },
 {
 "imageUrl" : "https:\/\/s3-ap-southeast-1.amazonaws.com\/lalamove-mock-api\/images\/pet-6.jpeg",
 "id" : 5,
 "description" : "Deliver parcel to Leviero",
 "location" : {
 "lng" : 114.170008,
 "lat" : 22.319181,
 "address" : "Mong Kok"
 }
 },
 {
 "imageUrl" : "https:\/\/s3-ap-southeast-1.amazonaws.com\/lalamove-mock-api\/images\/pet-4.jpeg",
 "id" : 6,
 "description" : "Deliver documents to Andrio",
 "location" : {
 "lng" : 114.155288,
 "lat" : 22.336093000000002,
 "address" : "Cheung Sha Wan"
 }
 },
 {
 "imageUrl" : "https:\/\/s3-ap-southeast-1.amazonaws.com\/lalamove-mock-api\/images\/pet-5.jpeg",
 "id" : 7,
 "description" : "Deliver pets to Alan",
 "location" : {
 "lng" : 114.170008,
 "lat" : 22.319181,
 "address" : "Mong Kok"
 }
 },
 {
 "imageUrl" : "https:\/\/s3-ap-southeast-1.amazonaws.com\/lalamove-mock-api\/images\/pet-0.jpeg",
 "id" : 8,
 "description" : "Deliver documents to Andrio",
 "location" : {
 "lng" : 114.170008,
 "lat" : 22.319181,
 "address" : "Mong Kok"
 }
 },
 {
 "imageUrl" : "https:\/\/s3-ap-southeast-1.amazonaws.com\/lalamove-mock-api\/images\/pet-7.jpeg",
 "id" : 9,
 "description" : "Deliver documents to Andrio",
 "location" : {
 "lng" : 114.155288,
 "lat" : 22.336093000000002,
 "address" : "Cheung Sha Wan"
 }
 }
 */
