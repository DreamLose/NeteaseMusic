//
//  MusicCalendarCell.swift
//  NeteaseMusic
//
//  Created by 2020 on 2020/7/20.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit

class MusicCalendarCell: UICollectionViewCell {
    var imgDatas : [String] = ["1","2","3"]
    fileprivate var timer : Timer?
    
    @IBOutlet weak var fristImg: UIImageView!
    @IBOutlet weak var secondImg: UIImageView!
    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.backgroundColor = UIColor.white
        backView.layer.shadowOffset = CGSize(width: 0, height:3)
        backView.layer.shadowOpacity = 0.3
        backView.layer.shadowColor = UIColor.lightGray.cgColor
        backView.layer.borderWidth = 0.5
        backView.layer.borderColor = UIColor.lightGray.cgColor
        backView.layer.cornerRadius = 8
        backView.layer.masksToBounds = true
        
        removeTimer()
        addTimer()
        // Initialization code
        
    }
    
    

}
extension MusicCalendarCell {
    fileprivate func addTimer(){
        timer = Timer(timeInterval: 3, target: self, selector: #selector(self.changeImg), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
    }
    fileprivate func removeTimer(){
        timer?.invalidate()
        timer = nil
    }
    @objc fileprivate func changeImg(){
        UIView.animate(withDuration: 1.5, animations: {
            self.fristImg.alpha = 1
        }) { (complent) in
            self.secondImg.frame = self.fristImg.frame
        }
    }
    
}
