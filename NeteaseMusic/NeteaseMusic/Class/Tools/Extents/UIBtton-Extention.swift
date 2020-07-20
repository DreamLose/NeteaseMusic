//
//  UIBtton-Extention.swift
//  NeteaseMusic
//
//  Created by 2020 on 2020/7/17.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit
extension UIButton {
     func clippingToCircle() {
        // 2 设置原型裁剪区域， 正切与图片
        print(point)
//        let maskPath = UIBezierPath(ovalIn: CGRect(origin: center, size: bounds.size))
        let maskPath = UIBezierPath(arcCenter: center, radius: 20, startAngle: CGFloat(Double.pi) * 0, endAngle: CGFloat(Double.pi) * 2, clockwise: true)
        // 2.1 把路径设置为裁切区域
        print(maskPath)
        let maskLayer : CAShapeLayer  = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer

    }
}
