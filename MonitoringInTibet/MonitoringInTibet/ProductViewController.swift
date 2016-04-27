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
    var productArray:NSArray?
    var fileTypeName:NSMutableArray? = []
    var childType:Bool = false
    var childTypeName = [[String]]()
    var childFile = [[NSArray]]()
    var childUrls = [[[String]]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "服务产品"
        self.view.backgroundColor = UIColor.whiteColor()
        
        tableview = UITableView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        
        self.view.addSubview(tableview)
        initTableview()
        
        getProduct()

    }
    
    func initTableview(){
        tableview.delegate = self;
        tableview.dataSource = self;
        
        tableview.registerClass(ProductOneLevelCell.self, forCellReuseIdentifier: "onecell")
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
                        
                        let db = (self.productArray![i] as? NSDictionary)?.valueForKey("data") as? NSDictionary
                        let child:NSArray = (db?.allKeys)!
                        let childCount = child.count
                        var childName = [String]()
                        var childFile = [NSArray]()
                        var childUrl = [[String]]()
                        for j in 0..<childCount{
                            let typeName = ((db?.objectForKey(child[j]) as? NSDictionary)?.objectForKey("type_name"))!
                            childName.append("\(typeName)")
                            let files:NSArray = (((db?.objectForKey(child[j]) as? NSDictionary)?.objectForKey("files"))?.allKeys)!
                            childFile.append(files)
                            
                            let urlCount = files.count
                            var url = [String]()
                            let cb = ((db?.objectForKey(child[j]) as? NSDictionary)?.objectForKey("files")) as? NSDictionary
                            for b in 0..<urlCount{
                                let u = (cb!.objectForKey("\(files[b])"))!
                                url.append(u as! String)
                            }
                            childUrl.append(url)
                        }
                        self.childUrls.append(childUrl)
                        self.childTypeName.append(childName)
                        self.childFile.append(childFile)
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
        let webview = ProductWebView()
        webview.webTitle = childTypeName[indexPath.section][indexPath.row]
        webview.webName = childFile[indexPath.section][indexPath.row]
        webview.webUrl = self.childUrls[indexPath.section][indexPath.row]
        self.navigationController?.pushViewController(webview, animated: true)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:ProductOneLevelCell = tableView.dequeueReusableCellWithIdentifier("onecell") as! ProductOneLevelCell

        //print(childTypeName[indexPath.section])
        if (childTypeName.count > 0){
            let name = self.childTypeName[indexPath.section][indexPath.row]
            cell.name?.text = "\(name)"
            cell.number.text = "\(self.childFile[indexPath.section][indexPath.row].count)"
        }else{
            cell.name?.text = "无"
            cell.number.text = "0"
        }
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return (fileTypeName?.count)! > 0 ? (self.fileTypeName?.count)! : 0
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (fileTypeName?.count)! > 0 ? self.fileTypeName![section] as! String : ""
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childTypeName[section].count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
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
