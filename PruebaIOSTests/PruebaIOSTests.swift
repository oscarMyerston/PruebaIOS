//
//  PruebaIOSTests.swift
//  PruebaIOSTests
//
//  Created by Oscar David Myerston Vega on 29/01/22.
//

import XCTest
@testable import PruebaIOS

class PruebaIOSTests: XCTestCase {
  
  var userDataBuilder: DataBuilder!
  var userApiService: ApiService!
  var userViewModel: UserViewModel!
  
  override func setUpWithError() throws {
    self.userDataBuilder = DataBuilder()
    self.userApiService = ApiService()
    self.userViewModel = UserViewModel(userModel: self.userApiService)
  }
  
  override func tearDownWithError() throws {
    self.userViewModel  = nil
    self.userApiService = nil
    self.userViewModel  = nil
  }
  
  func test_getUsersWithSuccessFull_ResponseWithZeroUsers() {
    let users: [User] = []
    self.userViewModel.getUserFromApi()
    self.userApiService.fetchSuccess(user: users)
    XCTAssertTrue(self.userViewModel.users.count == 0)
  }
  
  func test_getUsersWithSuccesFullResponseWithTenUsers() {
    let users: [User] = self.loadUsers()
    self.userViewModel.getUserFromApi()
    self.userApiService.fetchSuccess(user: users)
    XCTAssertTrue(self.userViewModel.users.count > 10)
  }
  
  func test_getUsersWithFailedResponseWithInternalError() {
    self.userViewModel.getUserFromApi()
    self.userApiService.fetchFail(error: .internalError)
    XCTAssertEqual(self.userViewModel.messageError, "Oops a error ocurred, try later")
  }
  
  func test_getUsersWithFailedResponseWithServerError() {
    self.userViewModel.getUserFromApi()
    self.userApiService.fetchFail(error: .serverError)
    XCTAssertEqual(self.userViewModel.messageError, "No Networking Connected")
  }
  
  func test_getUsersWithFailedResponseWithRequestError() {
    self.userViewModel.getUserFromApi()
    self.userApiService.fetchFail(error: .requestError)
    XCTAssertEqual(userViewModel.messageError, "Oops contact with support")
  }
  
  private func loadUsers() -> [User] {
    var users: [User] = []
    _ = (0...10).map({ _ in
      users.append(self.userDataBuilder.build())
    })
    return users
  }
}

