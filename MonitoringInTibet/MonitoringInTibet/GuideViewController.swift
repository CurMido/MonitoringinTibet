//
//  GuideViewViewController.swift
//  MonitoringInTibet
//
//  Created by 李伟 on 16/4/25.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class GuideViewViewController: UIPageViewController ,UIPageViewControllerDataSource{
    
     //var index = 0
    var heading = ["page1","page2","page3"]
    var page:UIPageControl!
    let fframe = UIScreen.mainScreen().bounds
    override func viewDidLoad() {
        super.viewDidLoad()
               
        dataSource = self
        
        if let startVC = createGuideViewController(0){
            setViewControllers([startVC], direction: .Forward, animated: true, completion: nil)
        }
        
        
        //小圆点
        page = UIPageControl(frame: CGRect(x: 0, y: fframe.height - 40, width: fframe.width, height: 40))
        page.backgroundColor = UIColor.darkGrayColor()
        //选择原点颜色
        page.currentPageIndicatorTintColor = UIColor.whiteColor()
        //原点个数
        page.numberOfPages = heading.count
        page.currentPage = 0
        
        self.view.addSubview(page)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : AnyObject]?) {
        super.init(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! GuideController).index
        page.currentPage = index
        index += 1
       
        return createGuideViewController(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! GuideController).index
        page.currentPage = index
        index -= 1
        
        return createGuideViewController(index)
    }
    
//    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
//        return heading.count
//    }
//    
//    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
//        return 0
//    }
    
    
    func createGuideViewController(current:Int)->GuideController?{
        if case 0..<heading.count = current{
            if let guideVC:GuideController = GuideController(){
                guideVC.header = self.heading[current]
                guideVC.index = current
                if current == 2 {
                    guideVC.buttonHidden = false
                }
                return guideVC
            }
        }
        return nil
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
