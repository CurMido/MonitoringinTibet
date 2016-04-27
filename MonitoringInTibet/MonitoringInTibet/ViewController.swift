//
//  ViewController.swift
//  MonitoringInTibet
//
//  Created by 李伟 on 16/4/9.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: BaseViewController ,UITextFieldDelegate{
    
    var logo:UIImageView!
    var userName:UITextField!
    var passWord:UITextField!
    var login:UIButton!
    var views:UIView!
    
    let viewsWidth = UIScreen.mainScreen().bounds.size.width / 4 * 3
    let viewsChildHight = (UIScreen.mainScreen().bounds.size.width / 4 * 3) / 6
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
        
        //导航栏透明
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.translucent = true
        
        //导航栏是否隐藏
        self.navigationController?.navigationBar.hidden = true
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if !defaults.boolForKey("guide") {
            if let guide:GuideViewViewController = GuideViewViewController(){
                presentViewController(guide, animated: true, completion: nil)
            }
        }
        defaults.setBool(true, forKey: "guide")
        
        views = UIView(frame: CGRect(x: 0, y: 0, width: viewsWidth, height: viewsWidth + 50))
        views.center = self.view.center
        
        logo = UIImageView(frame: CGRect(x: viewsWidth / 2 - viewsChildHight, y: 0, width: viewsChildHight * 2, height: viewsChildHight * 2))
        logo.image = UIImage(named: "logo")
        
        views.addSubview(logo)
        
        userName = UITextField(frame: CGRect(x: 0, y: viewsChildHight * 2 + (viewsChildHight / 3), width: views.bounds.size.width, height: viewsChildHight))
        userName.placeholder = "用户名"
        userName.text = "admin"
        userName.borderStyle = .RoundedRect
        userName.textAlignment = .Center
        userName.clearButtonMode = .WhileEditing
        userName.keyboardType = .ASCIICapable
        userName.returnKeyType = .Next
        
        views.addSubview(userName)
        
        passWord = UITextField(frame: CGRect(x: 0, y: viewsChildHight * 3 + (viewsChildHight / 3 * 2), width: views.bounds.size.width, height: viewsChildHight))
        passWord.placeholder = "密码"
        passWord.text = "admin"
        passWord.borderStyle = .RoundedRect
        passWord.textAlignment = .Center
        passWord.clearButtonMode = .WhileEditing
        passWord.secureTextEntry = true
        passWord.returnKeyType = .Go
        passWord.delegate = self
        
        views.addSubview(passWord)
        
        login = UIButton(frame: CGRect(x: 0, y: viewsChildHight * 4 + (viewsChildHight), width: views.bounds.size.width, height: viewsChildHight))
        login.setTitle("登录", forState: .Normal)
        login.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        login.backgroundColor = ColorUtil.getColor("#7F7F7F")
        login.layer.cornerRadius = 5
        login.addTarget(self, action: #selector(ViewController.Login), forControlEvents: .TouchUpInside)
        
        views.addSubview(login)
        
        
        self.view.addSubview(views)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        Login()
        return true
    }
    
    func Login(){
        
        let name = userName.text
        let pwd = passWord.text

        if (name == ""){
            self.view.makeToast("请输入用户名")
            return
        }else if (pwd == ""){
            self.view.makeToast("请输入密码")
            return
        }else{
            startLoad()
            Alamofire.request(.GET, "http://219.151.40.116:11112/xzjk/login/doLogin.do",parameters: ["user":name!,"pass":pwd!]).responseJSON { (json) in
                switch json.result{
                case .Success:
                    print(json.result.value)
                    if let dic = json.result.value as? NSDictionary{
                        let flag = dic.valueForKey("flag") as! Bool
                        if (flag == true){
                            
                            let main = MainViewController()
                            self.navigationController?.pushViewController(main, animated: true)
                            
                        }else{
                            let info = dic.valueForKey("info") as! String
                            self.view.makeToast(info)
                        }
                        self.stopLoad()
                    }
                    break
                case .Failure(let error):
                    self.stopLoad()
                    print(error)
                    break
                }
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        userName.resignFirstResponder()
        passWord.resignFirstResponder()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

