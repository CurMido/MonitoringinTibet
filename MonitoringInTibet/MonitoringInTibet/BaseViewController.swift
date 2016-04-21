//
//  BaseViewController.swift
//  MonitoringInTibet
//
//  Created by 李伟 on 16/4/11.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit
import Alamofire

class BaseViewController: UIViewController {
    
    var loading:UIActivityIndicatorView!
    
    let width = UIScreen.mainScreen().bounds.size.width
    let height = UIScreen.mainScreen().bounds.size.height

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func startLoad(){
        loading = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        loading.center = self.view.center
        loading.activityIndicatorViewStyle = .WhiteLarge
        loading.layer.cornerRadius = 10
        loading.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(loading)
        loading.startAnimating()
    }
    
    internal func stopLoad(){
        loading.stopAnimating()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
