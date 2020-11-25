//
//  TableViewCell.swift
//  4ahitm-medtmc-u4-json_download
//
//  Created by Quirin Ecker on 25.11.20.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var completedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func activateSwitch(_ sender: Any) {
        self.switch.isOn = !self.switch.isOn
    }
}
