//
//  Utilities.swift
//  PruebaIOS
//
//  Created by Oscar David Myerston Vega on 29/01/22.
//

import Foundation
import UIKit
import Alamofire

fileprivate var containerLoading: UIView?

enum TypeError: Error {
  case internalError
  case serverError
  case requestError
}

extension UIViewController {
  
  func loadingShow() {
    containerLoading = UIView(frame: self.view.bounds)
    containerLoading?.backgroundColor = .lightGray
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    activityIndicator.center = containerLoading!.center
    activityIndicator.startAnimating()
    containerLoading?.addSubview(activityIndicator)
    self.view.addSubview(containerLoading!)
    
  }
  
  func loadingHide() {
    containerLoading?.removeFromSuperview()
    containerLoading = nil
  }
}

extension UITableView {
  
  func emptyMessage(message: String) {
    let messageLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
    messageLabel.text = message
    messageLabel.textColor = .black
    messageLabel.numberOfLines = 0
    messageLabel.textAlignment = .center
    messageLabel.font = UIFont.systemFont(ofSize: 16)
    messageLabel.sizeToFit()
    self.backgroundView = messageLabel
    self.separatorStyle = .none
  }
  
  func restore() {
    self.backgroundView = nil
    self.separatorStyle = .singleLine
  }
  
  func deselectedAndSelectedRow(animated: Bool) {
    if let indexPathSelectedRow: IndexPath = self.indexPathForSelectedRow {
      self.deselectRow(at: indexPathSelectedRow, animated: true)
    }
  }
  
}
