//
//  MainChildCellCollectionViewCell.swift
//  MonitoringInTibet
//
//  Created by 李伟 on 16/4/10.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class MainChildCellCollectionViewCell: UICollectionViewCell {
    var image:UIImageView!
    var text:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let width = self.bounds.size.width
        let height = self.bounds.size.width / 3
        
        image = UIImageView(frame: CGRect(x: width / 2 - 20 , y: width / 2 - 30, width: 40, height:  40))
        image.contentMode = .ScaleAspectFit
        addSubview(image)
        
        text = UILabel(frame: CGRect(x: 0, y: height * 2, width: width, height: height))
        text.textAlignment = .Center
        text.font = UIFont.systemFontOfSize(14)
        
        addSubview(text)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
