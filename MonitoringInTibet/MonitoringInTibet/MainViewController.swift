//
//  MainViewController.swift
//  MonitoringInTibet
//
//  Created by 李伟 on 16/4/10.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit
import CoreLocation
class MainViewController: UIViewController ,UICollectionViewDataSource,UICollectionViewDelegate,CLLocationManagerDelegate{
    
    var weather:UIView!
    var child:UICollectionView!
    let height = UIScreen.mainScreen().bounds.size.height / 5
    let width = UIScreen.mainScreen().bounds.size.width
    
    let childName = ["实时地面数据","气象报文传输","服务产品","卫星云图","雷达资料","设置"]
    let childImage = ["network","message","ground","cloud","randar","setting"]
    
    let loactionManager:CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "西藏监控"
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.navigationController?.navigationBar.hidden = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .Done, target: self, action: nil)
        
        weather = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height * 3 - 1))
        let weatherTapGR:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MainViewController.goWeather))
        weather.addGestureRecognizer(weatherTapGR)
        
        let layout = UICollectionViewFlowLayout()
        //layout.scrollDirection = .Vertical
        layout.itemSize = CGSizeMake(width / 3 - 0.5,height * 2 / 2 - 1)
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 1.0
        //layout.sectionInset = UIEdgeInsetsMake(0, 0, 1, 1)//设置边距
        layout.headerReferenceSize = CGSizeMake(0, 0);
        
        
        child = UICollectionView(frame: CGRect(x: 0, y: height * 3, width: width, height: height * 2), collectionViewLayout: layout)
        child.backgroundColor = UIColor.grayColor()
        
        
        child.delegate = self
        child.dataSource = self
        
        let viewline = UIView(frame: CGRect(x: 0, y: height * 3 - 1, width: width, height: 1))
        viewline.backgroundColor = UIColor.grayColor()
        
        self.view.addSubview(weather)
        self.view.addSubview(viewline)

        self.view.addSubview(child)
        child.registerClass(MainChildCellCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        loactionManager.delegate = self
        //定位精度
        loactionManager.desiredAccuracy = kCLLocationAccuracyBest
        //更新距离
        loactionManager.distanceFilter = 100
        //发送授权申请
        loactionManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            loactionManager.startUpdatingLocation()
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func goWeather(){
        let weather = WeatherViewController()
        self.navigationController?.pushViewController(weather, animated: true)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currLocation:CLLocation = locations.last!
        print("经度\(currLocation.coordinate.longitude)")
        print("纬度\(currLocation.coordinate.latitude)")
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! MainChildCellCollectionViewCell
        cell.backgroundColor = UIColor.whiteColor()
        cell.image.image = UIImage(named: childImage[indexPath.row])
        cell.text.text = childName[indexPath.row]
        
        return cell;
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        switch indexPath.row{
        case 0:
            let ground = GroundViewController()
            self.navigationController?.pushViewController(ground, animated: true)
            break
        case 1:
            let mete = MeteorologicalViewController()
            self.navigationController?.pushViewController(mete, animated: true)
            break
        case 2:
            let product = ProductViewController()
            self.navigationController?.pushViewController(product, animated: true)
            break
        case 3:
            let sate = SatelliteViewController()
            self.navigationController?.pushViewController(sate, animated: true)
            break
        case 4:
            let radar = RadarViewController()
            self.navigationController?.pushViewController(radar, animated: true)
            break
        case 5:
            let set = SetViewController()
            self.navigationController?.pushViewController(set, animated: true)
            break
        default:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
