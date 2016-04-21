//
//  MeteorologicalViewController.swift
//  MonitoringInTibet
//
//  Created by 李伟 on 16/4/10.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class MeteorologicalViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "气象报文传输"
        self.view.backgroundColor = UIColor.whiteColor()
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        tableView.separatorStyle = .None //分割线为空
        self.view.addSubview(tableView)
        
        tableView.delegate = self;
        tableView.dataSource = self;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:MeteorologicalCell? = tableView.dequeueReusableCellWithIdentifier("cell") as? MeteorologicalCell
        if (cell == nil){
            cell = MeteorologicalCell(style: .Default, reuseIdentifier: "cell")
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150
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
