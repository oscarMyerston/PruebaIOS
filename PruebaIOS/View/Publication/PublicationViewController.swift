//
//  PublicationViewController.swift
//  PruebaIOS
//
//  Created by Oscar David Myerston Vega on 29/01/22.
//

import UIKit

class PublicationViewController: UIViewController, PublicationViewModelDelegate {
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var phoneLabel: UILabel!
  @IBOutlet weak var emailLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!
  
  let viewModel = PublicationViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    DispatchQueue.main.async {
      self.viewModel.delegate = self
      self.configureTableView()
      self.configureUserInformation()
      self.loadUserPublication()
      self.configureNavBar()
    }
  }
  
  func reloadTable() {
    self.tableView.reloadData()
    self.loadingHide()
  }
  
  private func configureTableView() {
    self.tableView.register(UINib(nibName: "PublicationTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.identifierPublication)
  }
  
  private func configureUserInformation() {
    self.nameLabel.text  = self.viewModel.user?.name
    self.phoneLabel.text = self.viewModel.user?.phone
    self.emailLabel.text = self.viewModel.user?.email
  }
  
  private func loadUserPublication() {
    self.loadingShow()
    self.viewModel.getPublicationByUser()
  }
  
  private func configureNavBar() {
    self.navigationItem.title = Constants.publicationNavTitle
  }
  
}

extension PublicationViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return Constants.cellSpacingHeightPublications
  }
}


extension PublicationViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.viewModel.publications.count
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.identifierPublication, for: indexPath) as! PublicationTableViewCell
    cell.configureCell(publication: self.viewModel.publications[indexPath.row])
    return cell
  }
  
  
}

