//
//  Net.swift
//  MonitoringInTibet
//
//  Created by 李伟 on 16/4/12.
//  Copyright © 2016年 liwei. All rights reserved.
//

import Foundation
import UIKit

class Net:NSObject,NSURLSessionDelegate{
    
    var url = ""
    
    enum UrlJoin:String{
        case Login = "http://219.151.40.116:11112/xzjk/ServiceData/login/changePass.do?"
    }

}
