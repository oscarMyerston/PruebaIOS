//
//  ApiService.swift
//  PruebaIOSTests
//
//  Created by Oscar David Myerston Vega on 29/01/22.
//

import Foundation
@testable import PruebaIOS

class ApiService: UserModel {
  
  var completion: ModelCompletion!
  
  override func getUserFromApi(completion: @escaping ModelCompletion) {
    self.completion = completion
  }
  
  func fetchSuccess(user: [User]) {
    completion(.success(user))
  }
  
  func fetchFail(error: TypeError) {
    completion(.failure(error))
  }
}
