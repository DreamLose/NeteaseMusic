//
//  RecommendEntityCell.swift
//  NeteaseMusic
//
//  Created by 2020 on 2020/7/20.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit
fileprivate let itemW :CGFloat = KScreenW - 45
fileprivate let RecommendEntityDetailCellID : String = "RecommendEntityDetailCellID"
fileprivate let RecommendPlaceholderCellID : String = "RecommendPlaceholderCellID"
class RecommendEntityCell: UICollectionViewCell {
    fileprivate var selectIndex : Int = 0
    @IBOutlet weak var recommendEntityCollection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        recommendEntityCollection.register(UINib(nibName: "RecommendEntityDetailCell", bundle: nil), forCellWithReuseIdentifier: RecommendEntityDetailCellID)
        recommendEntityCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: RecommendPlaceholderCellID)
        recommendEntityCollection.frame = self.frame
       
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = recommendEntityCollection.collectionViewLayout as! UICollectionViewFlowLayout
        let itemH : CGFloat = recommendEntityCollection.frame.height / 3
        layout.itemSize = CGSize(width: itemW, height: itemH)
    }

}

//MARK: ------- UICollectionView 代理
extension RecommendEntityCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 13
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 12 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendPlaceholderCellID, for: indexPath)
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendEntityDetailCellID, for: indexPath)
//        cell.contentView.backgroundColor = UIColor.randomColor()
        return cell
    }
    
    
}
//MARK: ------- 自定义分页范围
extension RecommendEntityCell : UICollectionViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x: CGFloat = targetContentOffset.pointee.x
        let pageWidth : CGFloat = itemW
        let movedX : CGFloat = x - pageWidth * CGFloat(selectIndex)
        if (movedX < -pageWidth * 0.5) {
            // Move left
            selectIndex -= 1
        } else if (movedX > pageWidth * 0.5) {
            // Move right
            selectIndex += 1
        }
        print(selectIndex)
        if selectIndex == 4 {
            selectIndex = 3
        }
        if (abs(velocity.x) >= 2){
           targetContentOffset.pointee.x = pageWidth * CGFloat(selectIndex);
        } else {
            targetContentOffset.pointee.x = scrollView.contentOffset.x;
            scrollView.setContentOffset(CGPoint(x: pageWidth * CGFloat(selectIndex), y: scrollView.contentOffset.y), animated: true)
        }
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let itemH : CGFloat = recommendEntityCollection.frame.height / 3
//        switch indexPath.item {
//        case 12:
//            let n = KScreenW / itemW
//            let w = KScreenW  - itemW * n
//            return CGSize(width: w, height: itemH)
//        default:
//            return CGSize(width: itemW, height: itemH)
//        }
//    }

}
