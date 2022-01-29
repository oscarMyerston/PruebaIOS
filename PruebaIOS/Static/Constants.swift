//
//  Constants.swift
//  PruebaIOS
//
//  Created by Oscar David Myerston Vega on 29/01/22.
//

import Foundation
import UIKit

struct Constants {
  static let secureProtocol: String = "https://"
  static let domain: String = "jsonplaceholder.typicode.com"
  static let url: String = Constants.secureProtocol + Constants.domain
  
  static let identifierUsersCell: String = "usersCell"
  static let identifierPublication: String = "publicationCell"
  
  static let userNavTitle: String = "Prueba de Ingreso"
  static let publicationNavTitle: String = "Publications"
  
  static let searchPlaceHolder: String = "Buscar Usuario"
  static let emptyMessage: String = "List is empty"
  
  static let  cellSpacingHeight: CGFloat = 70
  static let  cellSpacingHeightPublications: CGFloat = 200
  
}
