//
//  C_MainTableViewCell.swift
//  Knowli3-Reader
//
//  Created by 서 동훈 on 2014. 7. 6..
//  Copyright (c) 2014년 서 동훈. All rights reserved.
//

import UIKit

class C_MainTableViewCell: UITableViewCell {

//    init(style: UITableViewCellStyle, reuseIdentifier: String) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        // Initialization code
//    }

    @IBOutlet var contentImageView : UIImageView
    @IBOutlet var titleLabel : UILabel
    @IBOutlet var contentLabel : UILabel
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
