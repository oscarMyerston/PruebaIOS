//
//  DataBuilder.swift
//  PruebaIOSTests
//
//  Created by Oscar David Myerston Vega on 29/01/22.
//

import Foundation
@testable import PruebaIOS

public class DataBuilder {
  var id: Int
  var name: String
  var email: String
  var phone: String
  
  init() {
    self.id    = 0
    self.name  = "Default Value"
    self.email = "Defaul Value"
    self.phone = "Default Value"
  }
  
  func withId(id: Int) {
    self.id = id
  }
  
  func withName(name: String) {
    self.name = name
  }
  
  func withEmail(email: String) {
    self.email = email
  }
  
  func build() -> User {
    return User(id: id, name: name, email: email, phone: phone)
  }
  
}
