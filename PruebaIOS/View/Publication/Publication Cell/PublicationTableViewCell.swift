//
//  PublicationTableViewCell.swift
//  PruebaIOS
//
//  Created by Oscar David Myerston Vega on 29/01/22.
//

import UIKit

class PublicationTableViewCell: UITableViewCell {
  
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var bodyLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func configureCell(publication: Publication) {
    self.titleLabel.text = publication.title
    self.bodyLabel.text = publication.body
  }
  
}
