//
//  ProductCellTableViewCell.swift
//  MonitoringInTibet
//
//  Created by 李伟 on 16/4/21.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class MeteorologicalCell : UITableViewCell {
    
    var cellBackView:UIView!
    
    let width = UIScreen.mainScreen().bounds.size.width
    let height = UIScreen.mainScreen().bounds.size.height

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
        
        cellBackView = UIView(frame: CGRect(x: 20, y: 10, width: width - 40 , height: 140))
        
        cellBackView.layer.cornerRadius = 5
        cellBackView.backgroundColor = UIColor.grayColor()
        
        self.addSubview(cellBackView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
