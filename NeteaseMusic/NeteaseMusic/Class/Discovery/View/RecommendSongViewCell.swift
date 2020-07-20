//
//  RecommendSongViewCell.swift
//  NeteaseMusic
//
//  Created by 2020 on 2020/7/20.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit
fileprivate let songEntityCellId : String = "SongEntityCellId"
class RecommendSongViewCell: UICollectionViewCell {

    @IBOutlet weak var recommendCollection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        recommendCollection.register(UINib(nibName: "SongEntityCell", bundle: nil), forCellWithReuseIdentifier: songEntityCellId)
        recommendCollection.frame = self.frame
        recommendCollection.backgroundColor = UIColor.white


    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = recommendCollection.collectionViewLayout as! UICollectionViewFlowLayout
        let itemW :CGFloat = (recommendCollection.frame.width  - 4 * 15) / 3
        let itemH : CGFloat = itemW * 29 / 21
        layout.itemSize = CGSize(width: itemW, height: itemH)
    }
    

}


//MARK: ------- UICollectionView 代理
extension RecommendSongViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: songEntityCellId, for: indexPath)
        return cell
    }
    
    
}
