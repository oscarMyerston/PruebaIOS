//
//  UsersLocal.swift
//  PruebaIOS
//
//  Created by Oscar David Myerston Vega on 29/01/22.
//

import Foundation
import RealmSwift

class UsersLocal: Object {
  
  @objc dynamic var id: Int = 0
  @objc dynamic var name: String = ""
  @objc dynamic var email: String = ""
  @objc dynamic var phone: String = ""
}
