//
//  BaseTabbarController.swift
//  NeteaseMusic
//
//  Created by 2020 on 2020/7/17.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit

class BaseTabbarController: UITabBarController {
    fileprivate lazy var customTabBar :BaseTabBar = {
        let customTabBar = BaseTabBar(frame: self.tabBar.frame)
        customTabBar.tabDelegate = self
        return customTabBar
    }()
    //MARK: --系统自带
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
////        self.tabBar.isHidden = true
//        for (_ , item) in tabBar.subviews.enumerated() {
//            print(item)
//            if item is BaseTabBar {
//            } else {
//                item.isHidden = true
//                item.removeFromSuperview()
//            }
//        }
//        self.tabBar.bringSubviewToFront(self.customTabBar)
////
//    }
}

//MARK: --设置布局
extension BaseTabbarController {
    fileprivate func setUpUI() {
//        设置自定义tabbar
        self.setValue(customTabBar, forKey: "tabBar")
//        设置控制器
        configViewControllers()
    }
    fileprivate func configViewControllers() {
        var controllers : [BaseNavController] = [BaseNavController]()
        let disNav = BaseNavController(rootViewController: DiscoveryController())
        controllers.append(disNav)
        for _ in 0...3 {
            let viewController = UIViewController()
            viewController.view.backgroundColor = UIColor.randomColor()
            let nav :BaseNavController = BaseNavController(rootViewController: viewController)
            controllers.append(nav)
            
        }
        self.viewControllers = controllers
    }
}

//MARK: ------- tabbar 代理
extension BaseTabbarController : BaseTabBarDelegate {
    func clickTabIndex(tabbar: BaseTabBar, index: Int) {
        self.selectedIndex = index
    }
}


