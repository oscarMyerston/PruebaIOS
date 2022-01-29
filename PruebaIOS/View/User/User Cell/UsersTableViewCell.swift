//
//  UsersTableViewCell.swift
//  PruebaIOS
//
//  Created by Oscar David Myerston Vega on 29/01/22.
//

import UIKit

protocol SampleButtonViewDelegate: AnyObject {
  func sampleButtonTapped(_ button: UsersTableViewCell)
}

class UsersTableViewCell: UITableViewCell {
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var phoneLabel: UILabel!
  @IBOutlet weak var emailLabel: UILabel!
  @IBOutlet weak var button: UIButton!
  
  weak var delegate: SampleButtonViewDelegate?
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  @IBAction func actionButton(_ sender: UIButton) {
    self.delegate?.sampleButtonTapped(self)
  }
  
  func configureUsersCell(users: User) {
    self.nameLabel.text = users.name
    self.phoneLabel.text = users.phone
    self.emailLabel.text = users.email
  }
  
}
