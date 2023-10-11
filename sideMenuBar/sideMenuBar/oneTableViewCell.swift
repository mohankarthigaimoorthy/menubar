//
//  oneTableViewCell.swift
//  sideMenuBar
//
//  Created by Imcrinox Mac on 17/12/1444 AH.
//

import UIKit

class oneTableViewCell: UITableViewCell {

    @IBOutlet weak var userPost: UIImageView!
    @IBOutlet weak var userProfile: UIImageView!
    @IBOutlet weak var userTitle: UILabel!
    @IBOutlet weak var userSubTitle: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userProfile.layer.cornerRadius = userProfile.layer.frame.width / 2
        userProfile.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
