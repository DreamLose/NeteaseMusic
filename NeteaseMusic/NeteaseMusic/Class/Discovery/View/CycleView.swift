//
//  CycleView.swift
//  NeteaseMusic
//
//  Created by 2020 on 2020/7/19.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit

fileprivate let cycleImageCellId : String = "cycleImageCellId"
class CycleView: UIView {
    
    @IBOutlet weak var cycleCollection: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func awakeFromNib() {
        cycleCollection.register(UINib(nibName: "ViewCycleCell", bundle: nil), forCellWithReuseIdentifier: cycleImageCellId)
    }
}

extension CycleView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cycleImageCellId, for: indexPath) as! ViewCycleCell
        return cell  
    }
    
    
}
