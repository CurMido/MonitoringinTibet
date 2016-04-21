//
//  ColorUtil.swift
//  MonitoringInTibet
//
//  Created by 李伟 on 16/4/10.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit


class ColorUtil {
    static func getColor(hexColor:String) -> UIColor{
        
        var coloString:String = hexColor.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if(coloString.hasPrefix("#")){
            coloString = (coloString as NSString).substringFromIndex(1)
        }
        
        if(coloString.characters.count != 6){
            return UIColor.whiteColor()
        }
        let rString = (coloString as NSString).substringToIndex(2)
        let gString = ((coloString as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
        let bString = ((coloString as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
}
