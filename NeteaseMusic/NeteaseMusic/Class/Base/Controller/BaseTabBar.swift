//
//  BaseTabBar.swift
//  NeteaseMusic
//
//  Created by 2020 on 2020/7/17.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit
import SnapKit

protocol BaseTabBarDelegate :class {
    func clickTabIndex(tabbar:BaseTabBar,index:Int)
}

enum ItemType : Int {
    case DISCOVERY = 100
    case VIDEO = 110
    case MUSIC = 120
    case FRIEND = 130
    case ACCOUNT = 140
    
}
let baseTag : Int = 100
class BaseTabBar: UITabBar {
    weak var tabDelegate: BaseTabBarDelegate?
    fileprivate let dataList : [String] = ["cm6_btm_icn_discovery","cm6_btm_icn_video","cm6_btm_icn_music","cm6_btm_icn_friend","cm6_btm_icn_account"]
    fileprivate let titleList : [String] = ["发现","视频","我的","云村","账号"]
    fileprivate var itemData : [UIView] = [UIView]()
    fileprivate var currentIndex : Int = 0
    
//    MARK: -----系统函数
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK: ------- 重写方法,(必须)
    override func setItems(_ items: [UITabBarItem]?, animated: Bool) {}
    
    
}

//MARK: ------- 设置初始视图
extension BaseTabBar {
    fileprivate func setUpUI() {
        for (index,item) in dataList.enumerated() {
            creatItems(index: index, item: item,titleName: titleList[index])
        }
    }
    fileprivate func creatItems(index:Int,item:String,titleName:String) {
        let itemW : CGFloat = frame.width / CGFloat(dataList.count)
        let itemH : CGFloat = frame.height
        let itemY :CGFloat = 0
        let itemX : CGFloat = CGFloat(index) * itemW
        let view  = UIView(frame: CGRect(x: itemX, y: itemY, width: itemW, height: itemH), index: index,iamgeName: item,titleName:titleName)
        view.tag = index
        if index == 0 {
            currentIndex = view.tag
            view.isSelected = true
        }
        view.isUserInteractionEnabled = true
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(self.tabItemClick(tap:)))
        view.addGestureRecognizer(tapGes)
        itemData.append(view)
        addSubview(view)
    }
}

//MARK: -- 按钮点击
extension BaseTabBar {
    @objc fileprivate func tabItemClick(tap : UITapGestureRecognizer) {
        guard let view = tap.view else {return}
        //点击了自己
       if currentIndex == view.tag {
           return
       }
        let oldView = itemData[currentIndex]
        view.isSelected = true
        oldView.isSelected = false
       currentIndex = view.tag
        tabDelegate?.clickTabIndex(tabbar: self, index: view.tag)
        
//       UIView.animate(withDuration: 0.15) {
//           self.scrollLine.frame.origin.x = scrollLineX
//       }
//        lastBtn.isSelected = false
//        lastBtn.backgroundColor = UIColor.clear
//        item.isSelected = true
//        item.backgroundColor = UIColor.red
//        lastBtn = item
//        UIView.animate(withDuration: 0.2, animations: {
//            item.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
//        }) { (finished) in
//
//        }
//        if(btn.tag ==ItemTypeLanuch){
//               return;
//           }
//           self.lastBtn.selected =NO;
//           btn.selected =YES;
//           self.lastBtn =btn;
//           //设置动画
//           [UIView animateWithDuration:0.2 animations:^{
//               //扩大1.2倍
//               btn.transform = CGAffineTransformMakeScale(1.2, 1.2);
//           }completion:^(BOOL finished) {
//               //恢复原始状态
//               [UIView animateWithDuration:0.2 animations:^{
//                   btn.transform =CGAffineTransformIdentity;
//               }];
//           }];
    }
}


