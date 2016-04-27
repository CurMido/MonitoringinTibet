//
//  GuideControllerViewController.swift
//  MonitoringInTibet
//
//  Created by 李伟 on 16/4/25.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class GuideController: UIViewController {
    
    var headerLabel:UILabel!
    var button:UIButton!
    var page:UIPageControl!
    var index = 0
    var header = ""
    var buttonHidden = true

    let fframe = UIScreen.mainScreen().bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        headerLabel = UILabel(frame: CGRect(x: 0, y: 100, width: fframe.width, height: 100))
        headerLabel.textAlignment = .Center
        headerLabel.font = UIFont.systemFontOfSize(20)
        headerLabel.text = header
        
        self.view.addSubview(headerLabel)
        
        button = UIButton(frame: CGRect(x: fframe.width/2 - 50, y: fframe.height - 100, width: 100, height: 40))
        button.setTitle("立即进入", forState: .Normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor.grayColor(), forState: .Normal)
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(self.GB), forControlEvents: .TouchUpInside)
        
        
        self.view.addSubview(button)
        button.hidden = buttonHidden


        // Do any additional setup after loading the view.
    }
    
    func GB(){
        self.dismissViewControllerAnimated(true, completion: nil)
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
