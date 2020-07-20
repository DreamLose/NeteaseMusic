//
//  CommonView.swift
//  NeteaseMusic
//
//  Created by 2020 on 2020/7/20.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit
fileprivate let defultNum : Int = 9
fileprivate let commonViewCellId : String = "CommonViewCellId"
fileprivate let itemW : CGFloat = KScreenW * 2 / CGFloat(defultNum)
class CommonView: UIView {
    var commonModels : [String] = ["每日推荐","歌单","排行榜","电台","直播","火前留名","数字专辑","唱聊","线上演出 "]
    @IBOutlet weak var commonCollection: UICollectionView!
    
    //MARK: ------- 系统函数
    override func awakeFromNib() {
        commonCollection.register(UINib(nibName: "CommonViewCell", bundle: nil), forCellWithReuseIdentifier: commonViewCellId)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = commonCollection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width:itemW , height: commonCollection.bounds.height)
    }

}
//MARK: ------- 创建
extension CommonView {
    class func commonView() -> CommonView {
        return Bundle.main.loadNibNamed("CommonView", owner: nil, options: nil)?.first as! CommonView
    }
}
//MARK: ------- UICollectionView 代理
extension CommonView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return commonModels.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: commonViewCellId, for: indexPath) as! CommonViewCell
//        cell.contentView.backgroundColor = UIColor.randomColor()
        cell.iconImge.backgroundColor = UIColor.randomColor()
        cell.titleLba.text = commonModels[indexPath.item]
        return cell
    }
}
