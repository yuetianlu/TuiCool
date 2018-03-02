//
//  TableViewCell.swift
//  TuiCool
//
//  Created by yuetianlu on 2017/1/11.
//  Copyright © 2017年 yuetianlu. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var feed_title: UILabel!
    @IBOutlet weak var rightImage: UIImageView!
    
    @IBOutlet weak var time: UILabel!
    var model: HotListModel? {
        didSet {
            title.text = model?.title
            feed_title.text = model?.feed_title
            time.text = model?.rectime
            rightImage.setImage(model?.img, nil)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
