//
//  NetworkDataCachinePlugin.swift
//  Deliveree
//
//  Created by Failyn Sedik on 01/07/2019.
//  Copyright © 2019 Failyn Kaye Sedik. All rights reserved.
//

import Foundation
import Moya

protocol CachePolicyGettable {
  var cachePolicy: URLRequest.CachePolicy { get }
}

final class NetworkDataCachingPlugin: PluginType {
  
  func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
    if let cacheableTarget = target as? CachePolicyGettable {
      var mutableRequest = request
      mutableRequest.cachePolicy = cacheableTarget.cachePolicy
      return mutableRequest
    }
    
    return request
  }
  
}
