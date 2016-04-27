//
//  ProductTwoLevelCell.swift
//  MonitoringInTibet
//
//  Created by 李伟 on 16/4/25.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class ProductOneLevelCell: UITableViewCell {
    
    var name:UILabel!
    var number:UILabel!
    
    let frameF = UIScreen.mainScreen().bounds

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        name = UILabel(frame: CGRect(x: 20, y: 0, width: frameF.width - 24, height: 44))
        number = UILabel(frame: CGRect(x: frameF.width - 44, y: 0, width: 44, height: 44))
        number.textAlignment = .Center

        self.addSubview(name)
        self.addSubview(number)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
