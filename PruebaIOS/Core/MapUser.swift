//
//  MapUser.swift
//  PruebaIOS
//
//  Created by Oscar David Myerston Vega on 29/01/22.
//

import Foundation
import RealmSwift

class MapUser {
  
  static func mapResultToArray (listUserLocal: Results<UsersLocal>) -> [User] {
    let user: [User] = listUserLocal.map({ userLocal in
      return self.mapToUser(usersLocal: userLocal)
    })
    return user
  }
  
  static func mapToUser (usersLocal: UsersLocal) -> User {
    let user: User = User(id: usersLocal.id, name: usersLocal.name, email: usersLocal.email, phone: usersLocal.phone)
    return user
  }
  
  static func mapUserToLocal (user: User) -> UsersLocal {
    let userLocal: UsersLocal = UsersLocal()
    userLocal.id    = user.id
    userLocal.name  = user.name
    userLocal.email = user.email
    userLocal.phone = user.phone
    return userLocal
  }
}
