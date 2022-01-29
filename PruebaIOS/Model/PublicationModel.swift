//
//  PublicationModel.swift
//  PruebaIOS
//
//  Created by Oscar David Myerston Vega on 29/01/22.
//

import Foundation

enum PublicationEndPoints: String {
  case getPostByUser = "/posts?userId="
}

class PublicationModel {
  
  func getPublicationsByUser(userId: Int, completion: @escaping ModelCompletion) {
    let endPoint = PublicationEndPoints.getPostByUser.rawValue + "\(userId)"
    Connection.sendRequest(endPoint: endPoint) { response in
      switch response {
      case .success(let result):
        do {
          let publications = try JSONDecoder().decode([Publication].self, from: result)
          completion(.success(publications))
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
}
