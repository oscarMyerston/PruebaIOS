//
//  UserViewController.swift
//  PruebaIOS
//
//  Created by Oscar David Myerston Vega on 29/01/22.
//

import UIKit

class UserViewController: UIViewController, UserViewModelDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  
  private let viewModel: UserViewModel = UserViewModel()
  private let searchController = UISearchController(searchResultsController: nil)
  
  private var isSearchBarEmpty: Bool {
    return searchController.searchBar.text?.isEmpty ?? true
  }
  
  private var isFiltering: Bool {
    return searchController.isActive && !isSearchBarEmpty
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    DispatchQueue.main.async {
      self.viewModel.delegate = self
      self.registerTableView()
      self.configureSearchBar()
      self.configureNavBar()
      self.loadUsers()
    }
    
  }
  
  func reloadTable() {
    self.tableView.reloadData()
    self.loadingHide()
  }
  
  private func registerTableView() {
    self.tableView.register(UINib(nibName: "UsersTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.identifierUsersCell)
  }
  
  private func loadUsers() {
    self.loadingShow()
    self.viewModel.loadUsers()
  }
  
  private func configureSearchBar() {
    self.searchController.searchResultsUpdater = self
    self.searchController.obscuresBackgroundDuringPresentation = false
    self.searchController.searchBar.placeholder = Constants.searchPlaceHolder
    navigationItem.searchController = self.searchController
    definesPresentationContext = true
  }
  
  private func configureNavBar() {
    self.navigationItem.title = Constants.userNavTitle
    self.navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.tableView.deselectedAndSelectedRow(animated: true)
  }
  
}

// MARK: Search Controller
extension UserViewController: UISearchResultsUpdating {
  
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar: UISearchBar = searchController.searchBar
    if let searchText: String = searchBar.text {
      DispatchQueue.main.async {
        self.filterUserSearch(searchText: searchText)
      }
    }
  }
  
  private func filterUserSearch(searchText: String) {
    self.viewModel.userFiltered = self.viewModel.users.filter({ (user: User) -> Bool in
      return user.name.lowercased().contains(searchText.lowercased())
    })
    self.tableView.reloadData()
  }
}

// MARK: Table View Delegate
extension UserViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return Constants.cellSpacingHeight
  }
  
}

//MARK: Table View Data Source

extension UserViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let count: Int = !self.isFiltering ? self.viewModel.users.count : self.viewModel.userFiltered.count
    if count == 0 {
      tableView.emptyMessage(message: Constants.emptyMessage)
    } else {
      tableView.restore()
    }
    return count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UsersTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.identifierUsersCell, for: indexPath) as! UsersTableViewCell
    let users: User = !self.isFiltering ? self.viewModel.users[indexPath.row] : self.viewModel.userFiltered[indexPath.row]
    cell.delegate = self
    cell.configureUsersCell(users: users)
    return cell
  }
  
}

extension UserViewController: SampleButtonViewDelegate {
  
  func sampleButtonTapped(_ button: UsersTableViewCell) {
    // TODO: run logic for button tap here
    if let indexpath = self.tableView.indexPath(for: button) {
      let userSelected: User = !self.isFiltering ? self.viewModel.users[indexpath.row] : self.viewModel.userFiltered[indexpath.row]
      let story = UIStoryboard(name: "Publication", bundle: nil)
      let viewController = story.instantiateViewController(withIdentifier: "PublicationViewController") as! PublicationViewController
      viewController.viewModel.user = userSelected
      self.navigationController?.pushViewController(viewController, animated: true)
    }
  }
  
}

