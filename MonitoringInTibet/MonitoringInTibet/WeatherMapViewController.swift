//
//  WeatherMapViewController.swift
//  MonitoringInTibet
//
//  Created by 李伟 on 16/4/21.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit
import MapKit

class WeatherMapViewController: UIViewController,MKMapViewDelegate{
    
    var mapView:MKMapView!

    var currentLocationSpan:MKCoordinateSpan!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "天气地图"
        self.view.backgroundColor = UIColor.whiteColor()
        
        mapView = MKMapView(frame: self.view.frame)
        self.view.addSubview(mapView)
        //地图类型
        mapView.mapType = .Standard
        mapView.delegate = self
        mapView.showsUserLocation = true
        
//        //创建MKCoordinateSpan对象，设置地图范围
//        let latDelta = 0.05
//        let longDelta = 0.05
//        let currentLocationSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
//
//        //东经104.06北纬30.67
//        let center:CLLocation = CLLocation(latitude: lat, longitude: long)
//        let currentRegion:MKCoordinateRegion = MKCoordinateRegion(center: center.coordinate, span: currentLocationSpan)
//        
//        //设置显示区域
//        mapView.setRegion(currentRegion, animated: true)
//        
//        //创建大头针位置
//        let objectAnnottation = MKPointAnnotation()
//        //设置大头针显示位置
//        objectAnnottation.coordinate
//            = CLLocation(latitude: lat, longitude: long).coordinate
//        //这种点击大头针之后显示的标题
//        objectAnnottation.title = "成都"
//        //设置点击大头针之后显示的描述
//        objectAnnottation.subtitle = "一个来了就不想走的地方"
//        
//        
//        //添加大头针
//        mapView.addAnnotation(objectAnnottation)
//        mapView.selectAnnotation(objectAnnottation, animated: true)

    
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        var result:MKAnnotationView! = nil
        if (annotation.isKindOfClass(MKAnnotation)) {
            return result
        }
        
        if (mapView.isEqual(self.mapView) == false) {
            return result
        }
        
        
        let sendAnnotion:MKAnnotation = annotation

        let index = "an"
        var anntionView:MKPinAnnotationView! = mapView.dequeueReusableAnnotationViewWithIdentifier(index) as? MKPinAnnotationView
        if (anntionView == nil) {
            anntionView = MKPinAnnotationView(annotation: sendAnnotion, reuseIdentifier: index)
            anntionView.userActivity?.title = "fkjdsakjfhakljsdflkajsdhfaskj"
            anntionView.canShowCallout = true
        }
    
        anntionView.opaque = false
        anntionView.animatesDrop = true
        anntionView.draggable = true
        anntionView.selected = true
        anntionView.calloutOffset = CGPointMake(15, 15)
    
    
        result = anntionView
        
        return result
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        
        let loc:CLLocationCoordinate2D = userLocation.coordinate
        let region:MKCoordinateRegion  = MKCoordinateRegionMakeWithDistance(loc, 250,250 )
        mapView.setRegion(region, animated: true)
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
