//
//  UIView-Extention.swift
//  NeteaseMusic
//
//  Created by 2020 on 2020/7/18.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit
import SnapKit
//MARK: ------- 添加属性
extension UIView  {
    
    private struct AssociatedKey {
        static var isSelected: Bool = false
    }
    
    public var isSelected: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.isSelected) as? Bool ?? false
        }
        
        set {
            objc_setAssociatedObject(self, &AssociatedKey.isSelected, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
           for sub in subviews {
                if sub is UIImageView {
                    (sub as! UIImageView).isHighlighted = isSelected
                    sub.backgroundColor = isSelected ? UIColor.red : UIColor.clear
                }
                if sub is UILabel {
                    (sub as! UILabel).textColor = isSelected ? UIColor.red : UIColor.lightGray
                     
                }
            }
        }
    }

    
}

extension UIView {
    convenience init(frame:CGRect,index:Int,iamgeName:String,titleName:String) {
        self.init(frame:frame)
        setUpUI(iamgeName: iamgeName, titleName: titleName)
    }
}
extension UIView {
    fileprivate func setUpUI(iamgeName:String,titleName:String) {
        let imageView = UIImageView()
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.width.equalTo(25)
            make.height.equalTo(25)
            make.centerX.equalTo(self)
            make.centerY.equalToSuperview().offset(-8)
        }
        imageView.image = UIImage(named: iamgeName)
        imageView.highlightedImage = UIImage(named: "\(iamgeName)_prs")
        imageView.layer.cornerRadius = 12.5
        imageView.layer.masksToBounds = true
        let titleLab = UILabel()
        titleLab.text = titleName
        titleLab.textAlignment = .center
        titleLab.font = UIFont.systemFont(ofSize: 10)
        titleLab.sizeToFit()
        addSubview(titleLab)
        titleLab.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.centerX.equalTo(imageView)
        }
//        if isSelected {
//            imageView.isHighlighted = true
//            imageView.layer.cornerRadius = 12.5
//            imageView.layer.masksToBounds = true
//            imageView.backgroundColor = UIColor.red
//            titleLab.textColor = UIColor.red
//        } else {
//            imageView.isHighlighted = false
//            imageView.backgroundColor = UIColor.clear
//            titleLab.textColor = UIColor.lightGray
//        }
        
    }
}
