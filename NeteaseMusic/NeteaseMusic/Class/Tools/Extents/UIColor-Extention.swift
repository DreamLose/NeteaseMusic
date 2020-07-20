//
//  UIColor-Extention.swift
//  NeteaseMusic
//
//  Created by 2020 on 2020/7/17.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit
extension UIColor {
    convenience init(r:CGFloat , g:CGFloat, b:CGFloat) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
    }
    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
    }
}
