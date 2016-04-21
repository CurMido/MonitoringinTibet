//
//  ChangePassViewController.swift
//  MonitoringInTibet
//
//  Created by 李伟 on 16/4/18.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit
import Alamofire

class ChangePassViewController: BaseViewController {

    let url = "http://219.151.40.116:11112/xzjk/login/changePass.do"
    
    var user:UITextField!
    var pass:UITextField!
    var newPass:UITextField!
    var button:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "修改密码"
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        user = UITextField(frame: CGRect(x: 20, y: 85, width: width - 40, height: 40))
        user.placeholder = "请输入用户名"
        user.borderStyle = .RoundedRect
        user.textAlignment = .Center
        user.clearButtonMode = .WhileEditing
        user.text = "admin"
        
        pass = UITextField(frame: CGRect(x: 20, y: 145, width: width - 40, height: 40))
        pass.placeholder = "请输入旧密码"
        pass.borderStyle = .RoundedRect
        pass.textAlignment = .Center
        pass.clearButtonMode = .WhileEditing
        pass.keyboardType = .ASCIICapable
        pass.secureTextEntry = true
        pass.text = "admin"
        
        newPass = UITextField(frame: CGRect(x: 20, y: 205, width: width - 40, height: 40))
        newPass.placeholder = "请输入新密码"
        newPass.secureTextEntry = true
        newPass.borderStyle = .RoundedRect
        newPass.textAlignment = .Center
        newPass.clearButtonMode = .WhileEditing
        newPass.keyboardType = .ASCIICapable
        newPass.text = "admin"
        
        button = UIButton(frame: CGRect(x: 20, y: 305, width: width - 40, height: 50))
        button.setTitle("确认修改", forState: .Normal)
        button.backgroundColor = ColorUtil.getColor("#1E90FF")
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(ChangePassViewController.changePass), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(user)
        self.view.addSubview(pass)
        self.view.addSubview(newPass)
        self.view.addSubview(button)

        // Do any additional setup after loading the view.
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
       onKeyBoard()
    }
    
    func onKeyBoard(){
        user.resignFirstResponder()
        pass.resignFirstResponder()
        newPass.resignFirstResponder()
    }
    
    func changePass(){
        onKeyBoard()
        let userl = user.text
        let passl = pass.text
        let newpassl = newPass.text
        
        if (userl == "") {
            self.view.makeToast("用户名不能为空")
        }else if(passl == ""){
            self.view.makeToast("旧密码不能为空")
        }else if(newpassl == ""){
            self.view.makeToast("新密码不能为空")
        }else{
            //startLoad()
            let opt = Alamofire.request(.POST, url,parameters: ["user":userl!,"pass":passl!,"newPass":newpassl!])
            opt.responseJSON { (
                date) in
                print(date)
                switch date.result{
                case .Success:
                    if let dic = date.result.value as? NSDictionary{
                        let info = dic.valueForKey("info") as! String
                        self.stopLoad()
                        self.view.makeToast(info)
                        self.navigationController?.popViewControllerAnimated(true)
                    }
                    break
                case .Failure(let err):
                    self.startLoad()
                    print(err)
                    break
                }
                
            }
        }
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
