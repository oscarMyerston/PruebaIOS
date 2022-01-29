//
//  Coordinates.swift
//  PruebaIOS
//
//  Created by Oscar David Myerston Vega on 29/01/22.
//

import Foundation

struct Coordinates: Codable {
  
  var lat: String
  var lng: String
  
  private enum CondingKeys: CodingKey {
    case lat
    case lng
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CondingKeys.self)
    self.lat = try container.decode(String.self, forKey: .lat)
    self.lng = try container.decode(String.self, forKey: .lng)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CondingKeys.self)
    try container.encode(lat, forKey: .lat)
    try container.encode(lng, forKey: .lng)
  }
}
