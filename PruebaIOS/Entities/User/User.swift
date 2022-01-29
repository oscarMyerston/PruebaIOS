//
//  User.swift
//  PruebaIOS
//
//  Created by Oscar David Myerston Vega on 29/01/22.
//

import Foundation

struct User: Codable {
  
  var id: Int
  var name: String
  var username: String
  var email: String
  var address: Address?
  var phone: String
  var website: String
  var company: Company?
  
  private enum CodingKeys: CodingKey {
    case id
    case name
    case username
    case email
    case address
    case phone
    case website
    case company
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.id       = try container.decode(Int.self,     forKey: .id)
    self.name     = try container.decode(String.self,  forKey: .name)
    self.username = try container.decode(String.self,  forKey: .username)
    self.email    = try container.decode(String.self,  forKey: .email)
    self.address  = try container.decode(Address.self, forKey: .address)
    self.phone    = try container.decode(String.self,  forKey: .phone)
    self.website  = try container.decode(String.self,  forKey: .website)
    self.company  = try container.decode(Company.self, forKey: .company)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id,       forKey: .id)
    try container.encode(name,     forKey: .name)
    try container.encode(username, forKey: .username)
    try container.encode(email,    forKey: .email)
    try container.encode(address,  forKey: .address)
    try container.encode(phone,    forKey: .phone)
    try container.encode(website,  forKey: .website)
    try container.encode(company,  forKey: .company)
    
  }
  
  init(id: Int = 0, name: String = "", username: String = "", email: String = "", address: Address? = nil, phone: String = "", website: String = "", company: Company? = nil) {
    self.id       = id
    self.name     = name
    self.username = username
    self.email    = email
    self.address  = address
    self.phone    = phone
    self.website  = website
    self.company  = company
  }
}
