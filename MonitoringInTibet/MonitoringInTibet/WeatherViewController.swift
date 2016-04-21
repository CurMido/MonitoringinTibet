//
//  WeatherViewController.swift
//  MonitoringInTibet
//
//  Created by 李伟 on 16/4/21.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class WeatherViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "天气预报"
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "地图", style: .Done, target: self, action: #selector(WeatherViewController.map))

        // Do any additional setup after loading the view.
    }
    
    func map(){
        let map = WeatherMapViewController()
        self.navigationController?.pushViewController(map, animated: true)
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
