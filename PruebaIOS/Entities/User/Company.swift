//
//  Company.swift
//  PruebaIOS
//
//  Created by Oscar David Myerston Vega on 29/01/22.
//

import Foundation

struct Company: Codable {
  
  var name: String
  var catchPhrase: String
  var bs: String
  
  private enum CodingKeys: CodingKey {
    case name
    case catchPhrase
    case bs
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.name = try container.decode(String.self, forKey: .name)
    self.catchPhrase = try container.decode(String.self, forKey: .catchPhrase)
    self.bs = try container.decode(String.self, forKey: .bs)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(name, forKey: .name)
    try container.encode(catchPhrase, forKey: .catchPhrase)
    try container.encode(bs, forKey: .bs)
  }
}
