//
//  TableViewCell.swift
//  clothing app
//
//  Created by Wali Faisal on 06/10/2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var sidebarimage: UIImageView!
    
    @IBOutlet weak var sidebarlabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
