//
//  DeliveryService.swift
//  Deliveree
//
//  Created by Failyn Sedik on 29/06/2019.
//  Copyright © 2019 Failyn Kaye Sedik. All rights reserved.
//

import Moya

let deliveryProvider = MoyaProvider<DeliveryService>(plugins: [NetworkLoggerPlugin(verbose: true), NetworkDataCachingPlugin()])

enum DeliveryService {
  /// Offset - Starting index
  /// Limit - Number of items requested
  case getDeliveries(offset: Int, limit: Int)
}

extension DeliveryService: TargetType {
  var baseURL: URL {
    return URL(string: "https://mock-api-mobile.dev.lalamove.com")!
  }
  
  var path: String {
    switch self {
    case .getDeliveries:
      return "/deliveries"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .getDeliveries:
      return .get
    }
  }
  
  var sampleData: Data {
    switch self {
    case .getDeliveries:
      return Data()
    }
  }
  
  var task: Task {
    switch self {
    case let .getDeliveries(offset, limit):
      return .requestParameters(
        parameters: [
          "offset": offset,
          "limit": limit
        ],
        encoding: URLEncoding.default
      )
    }
  }
  
  var headers: [String : String]? {
    return ["Content-Type": "application/json"]
  }
  
  var validationType: ValidationType {
    return .successCodes
  }
}

extension DeliveryService: CachePolicyGettable {
  
  var cachePolicy: URLRequest.CachePolicy {
    switch self {
    case .getDeliveries:
      return .returnCacheDataElseLoad
    }
  }
  
}
