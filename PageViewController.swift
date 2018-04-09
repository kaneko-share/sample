//
//  PageViewController.swift
//  PageViewController
//
//  Created by 金子 昭一 on 2018/04/09.
//  Copyright © 2018年 Share Inc. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

    //最初のviewControllerを設定する
    self.setViewControllers([getFirst()], direction: .reverse, animated: true, completion: nil)
        
    self.dataSource = self

    }
    
    
    
    //StoryBoard上のFirstViewControllerをインスタンス化する
    //withIdentifierは、StoryBoard上で設定したStoryBoard Id
    func getFirst() -> FirstViewController{
        return storyboard!.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
    }
    
    func getSecond() -> SecondViewController{
        return storyboard!.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
    }
    
    func getThird() -> ThirdViewController{
        return storyboard!.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if viewController.isKind(of: ThirdViewController.self)
        {
            return getSecond()
        }
    
        else if viewController.isKind(of: SecondViewController.self)
        {
            return getFirst()
        }
    
        else
        {
            return nil
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if viewController.isKind(of: FirstViewController.self)
        {
            return getSecond()
        }
            
        else if viewController.isKind(of: SecondViewController.self)
        {
            return getThird()
        }
            
        else
        {
            return nil
        }
        
    }
    
    
    

}
