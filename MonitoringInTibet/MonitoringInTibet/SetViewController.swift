//
//  SetViewController.swift
//  MonitoringInTibet
//
//  Created by 李伟 on 16/4/10.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class SetViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    var tablview:UITableView!
    let setChild = ["修改密码","关于我们","意见反馈","注销登录"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "设置"
        self.view.backgroundColor = UIColor.whiteColor()
        
        tablview = UITableView(frame: UIScreen.mainScreen().bounds)
        tablview.delegate = self
        tablview.dataSource = self
        tablview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(tablview)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if (indexPath.row == 0) {
            let changePass = ChangePassViewController()
            self.navigationController?.pushViewController(changePass, animated: true)
        }
        if (indexPath.row == 3){
            self.navigationController?.navigationBar.hidden = true
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tablview.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = setChild[indexPath.row]
        cell.accessoryType = .DisclosureIndicator
        if indexPath.row == (setChild.count - 1){
            cell.textLabel?.textColor = UIColor.redColor()
        }
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setChild.count
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
