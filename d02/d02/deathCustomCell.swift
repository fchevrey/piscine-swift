//
//  deathCustomCell.swift
//  d02
//
//  Created by Fabien CHEVREY on 18/11/2020.
//

import UIKit

class deathCustomCell: UITableViewCell
{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var howLabel: UILabel!
    var data : (name:String, date:String, how:String)?
    {
        didSet
        {
            if let f = data
            {
                nameLabel.text = f.name
                dateLabel.text = f.date
                howLabel.text = f.how
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        howLabel.numberOfLines = 0
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
