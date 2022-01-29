//
//  PublicationViewModel.swift
//  PruebaIOS
//
//  Created by Oscar David Myerston Vega on 29/01/22.
//

import Foundation

protocol PublicationViewModelDelegate: AnyObject {
  func reloadTable()
}

class PublicationViewModel {
  
  var user: User?
  private let model: PublicationModel
  var publications: [Publication] = []
  weak var delegate: PublicationViewModelDelegate?
  var messageError: String = String()
  
  init(publicationsModel: PublicationModel = PublicationModel()) {
    self.model = publicationsModel
  }
  
  func getPublicationByUser() {
    guard let userId = self.user?.id else { return }
    self.model.getPublicationsByUser(userId: userId) { [weak self] response in
      guard let _ = self else { return }
      switch response {
      case .success(let result):
        if let postsFromApi = result as? [Publication] {
          self?.publications = postsFromApi
        }
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
      self?.delegate?.reloadTable()
    }
  }
}
