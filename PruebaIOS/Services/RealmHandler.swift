//
//  RealmHandler.swift
//  PruebaIOS
//
//  Created by Oscar David Myerston Vega on 29/01/22.
//

import Foundation
import RealmSwift

class RealmHandler {
  
  var realm: Realm!
  
  init() {
    do {
      self.realm = try Realm()
    } catch {
      print("Error Realm: \(error.localizedDescription)")
    }
  }
  
  func getUsers() ->[User] {
    return MapUser.mapResultToArray(listUserLocal: self.realm.objects(UsersLocal.self))
  }
  
  func addUser(_ user: User) -> Bool {
    var result = false
    if !filterUserInDB(userId: user.id) {
      self.insertUser(user: user)
      result = true
    }
    return result
  }
  
  func filterUserInDB(userId: Int) -> Bool {
    var existUserLocal = false
    let userLocal: Results<UsersLocal> = self.realm.objects(UsersLocal.self).filter("id == \(userId)")
    if !userLocal.isEmpty {
      existUserLocal = true
    }
    return existUserLocal
  }
  
  func insertUser(user: User) {
    do {
      let mapUser: UsersLocal = MapUser.mapUserToLocal(user: user)
      try realm.write({
        self.realm.add(mapUser)
      })
    } catch {
      print("Error insert:\(error.localizedDescription)")
    }
  }
}
