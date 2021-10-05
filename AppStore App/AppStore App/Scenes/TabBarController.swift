//
//  TabBarController.swift
//  AppStore App
//
//  Created by 김선웅 on 2021/10/05.
//

import UIKit
import SnapKit

class TabBarController: UITabBarController {
    
    private lazy var todayViewController: UIViewController = {
        let viewController = TodayViewController()
//        첫 번째 탭이므로 0
        let tabBarItem = UITabBarItem(title: "투데이", image: UIImage(systemName: "mail"), tag: 0)
        
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    
    private lazy var appViewController: UIViewController = {
        let viewController = UIViewController()
        
        let tabBarItem = UITabBarItem(title: "앱", image: UIImage(systemName: "square.stack.3d.up"), tag: 1)
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
           
//        tabBar.backgroundColor = .gray
        tabBar.tintColor = .black
        viewControllers = [todayViewController, appViewController]
    }
}
