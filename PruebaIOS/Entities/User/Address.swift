//
//  Address.swift
//  PruebaIOS
//
//  Created by Oscar David Myerston Vega on 29/01/22.
//

import Foundation

struct Address: Codable {
  
  let street: String
  let suite: String
  let city: String
  let zipcode: String
  let geo: Coordinates?
  
  private enum CodingKeys: CodingKey {
    case street
    case suite
    case city
    case zipcode
    case geo
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.street = try container.decode(String.self, forKey: .street)
    self.suite = try container.decode(String.self, forKey: .suite)
    self.city = try container.decode(String.self, forKey: .city)
    self.zipcode = try container.decode(String.self, forKey: .zipcode)
    self.geo = try container.decode(Coordinates.self, forKey: .geo)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(street, forKey: .street)
    try container.encode(suite, forKey: .suite)
    try container.encode(city, forKey: .city)
    try container.encode(zipcode, forKey: .zipcode)
    try container.encode(geo, forKey: .geo)
    
  }
}
