//
//  ProductWebView.swift
//  MonitoringInTibet
//
//  Created by 李伟 on 16/4/25.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class ProductWebView: UIViewController {
    
    var webTitle:String!
    var webUrl:NSArray!
    var webName:NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = webTitle
        self.view.backgroundColor = UIColor.whiteColor()
        let webview = UIWebView(frame: UIScreen.mainScreen().bounds)
        let url = NSURL(string: webUrl[0] as! String)
        let request = NSURLRequest(URL: url!)
        webview.loadRequest(request)
        webview.scalesPageToFit = true
        self.view.addSubview(webview)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
