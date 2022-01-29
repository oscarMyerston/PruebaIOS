//
//  Publication.swift
//  PruebaIOS
//
//  Created by Oscar David Myerston Vega on 29/01/22.
//

import Foundation

struct Publication: Decodable {
  
  var userId: Int
  var id: Int
  var title: String
  var body: String
  
  private enum CodingKeys: CodingKey {
    case userId
    case id
    case title
    case body
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.userId = try container.decode(Int.self, forKey: .userId)
    self.id = try container.decode(Int.self, forKey: .id)
    self.title = try container.decode(String.self, forKey: .title)
    self.body = try container.decode(String.self, forKey: .body)
  }
}
