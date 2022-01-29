//
//  UserViewModel.swift
//  PruebaIOS
//
//  Created by Oscar David Myerston Vega on 29/01/22.
//

import Foundation

protocol UserViewModelDelegate: AnyObject {
  func reloadTable()
}

class UserViewModel {
  
  private let model: UserModel
  weak var delegate: UserViewModelDelegate?
  var users: [User] = []
  var userFiltered: [User] = []
  var messageError: String = String()
  
  init(userModel: UserModel = UserModel()) {
    self.model = userModel
  }
  
  func loadUsers() {
    
    self.model.fetchUsersFromDBLocal { [weak self] response in
      guard let _ = self else { return }
      switch response {
      case .success(let result):
        if let usersFromDB: [User] = result as? [User] {
          if !usersFromDB.isEmpty {
            self?.users = usersFromDB
          } else {
            self?.getUserFromApi()
          }
        }
        self?.delegate?.reloadTable()
        break
      case .failure(let error):
        switch error {
        case .internalError:
          self?.messageError = "Oops a error ocurred, try later"
          break
        case .serverError:
          self?.messageError = "No Networking Connected"
          break
        case .requestError:
          self?.messageError = "Oops contact with support"
          break
        }
        break
      }
    }
  }
  
  func getUserFromApi() {
    print("ingresó test")
    self.model.getUserFromApi { [weak self] response in
      guard let _ = self else { return }
      switch response {
      case .success(let result):
        if let usersFromApi: [User] = result as? [User] {
          _ = usersFromApi.map({
            self?.insertUserToDBLocal(user: $0)
          })
          self?.users = usersFromApi
        }
        self?.delegate?.reloadTable()
        break
      case .failure(let error):
        switch error {
        case .internalError:
          self?.messageError = "Oops a error ocurred, try later"
          break
        case .serverError:
          self?.messageError = "No Networking Connected"
          break
        case .requestError:
          self?.messageError = "Oops contact with support"
          break
        }
        break
      }
    }
  }
  
  func insertUserToDBLocal(user: User) {
    
    self.model.insertUserToDBLocal(user) { [weak self] response in
      guard let _ = self else { return }
      switch response {
      case .success(let result):
        if let result: String = result as? String {
          print("result insertUserToDBLocal: \(result)")
        }
        break
      case .failure(let error):
        switch error {
        case .internalError:
          self?.messageError = "Oops a error ocurred, try later"
        case .serverError:
          self?.messageError = "No Networking Connected"
        case .requestError:
          self?.messageError = "Oops contact with support"
        }
        break
      }
    }
  }
}
