//
//  CustomTableViewCell.swift
//  Telegraph
//
//  Created by Daniil Kulikovskiy on 04.06.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    
    
  
    override func awakeFromNib() {
        super.awakeFromNib()
        messageBubble.layer.cornerRadius = 16
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
