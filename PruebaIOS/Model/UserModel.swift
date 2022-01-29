//
//  UserModel.swift
//  PruebaIOS
//
//  Created by Oscar David Myerston Vega on 29/01/22.
//

import Foundation
import RealmSwift

enum EndPoints: String {
case getUsers = "/users"
}

typealias ModelCompletion = ((_ response: Result<Any, TypeError>) -> Void )

class UserModel {
  
  var realmHandler: RealmHandler
  init(realmHandler: RealmHandler = RealmHandler()) {
    self.realmHandler = realmHandler
  }
  
  func fetchUsersFromDBLocal(completion: @escaping ModelCompletion) {
    let users: [User] = self.realmHandler.getUsers()
    completion(.success(users))
  }
  
  func getUserFromApi(completion: @escaping ModelCompletion) {
    Connection.sendRequest(endPoint: EndPoints.getUsers.rawValue) { response in
      switch response {
      case .success(let result):
        do {
          let dataUsers = try JSONDecoder().decode([User].self, from: result)
          completion(.success(dataUsers))
        } catch {
          completion(.failure(.internalError))
        }
        break
      case .failure(let error):
        completion(.failure(error))
        break
      }
    }
  }
  
  func insertUserToDBLocal(_ user: User, completion: @escaping ModelCompletion) {
    let addUser: Bool = self.realmHandler.addUser(user)
    if addUser {
      completion(.success("Competed"))
    } else {
      completion(.success("Competed"))
    }
  }
  
}
