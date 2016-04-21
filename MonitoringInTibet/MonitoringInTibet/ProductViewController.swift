//
//  ProductViewController.swift
//  MonitoringInTibet
//
//  Created by 李伟 on 16/4/10.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit
import Alamofire

class ProductViewController: BaseViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var tableview:UITableView!
    let width = UIScreen.mainScreen().bounds.width
    let height = UIScreen.mainScreen().bounds.height
    var productArray:NSArray?
    var fileTypeName:NSMutableArray? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "服务产品"
        self.view.backgroundColor = UIColor.whiteColor()
        
        tableview = UITableView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        
        self.view.addSubview(tableview)
        
        tableview.delegate = self;
        tableview.dataSource = self;
        tableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        getProduct()

    }
    
    func getProduct(){
        startLoad()
        Alamofire.request(.GET, "http://219.151.40.116:11112//xzjk/ServiceData/getMSP.do").responseJSON { (json) in
            self.stopLoad()
            switch json.result{
            case .Success:
                self.productArray = json.result.value as? NSArray
                
                if (self.productArray != nil) || (self.productArray?.count > 0){
                    for i in 0..<(self.productArray?.count)!{
                        let dic = self.productArray![i] as? NSDictionary
                        self.fileTypeName?.addObject(dic!.valueForKey("filetype_name")!)
                    }
                    self.tableview.reloadData()
                }else{
                    self.view.makeToast("数据请求失败")
                }
                self.stopLoad()
                
               
                break
            case .Failure(let err):
                print(err)
                break
            }
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        
        if (fileTypeName != nil || fileTypeName?.count > 0){
            cell?.textLabel?.text = self.fileTypeName![indexPath.row] as? String
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productArray == nil ? 0 : (self.productArray?.count)!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
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
