//
//  CycleView.swift
//  NeteaseMusic
//
//  Created by 2020 on 2020/7/19.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit
fileprivate let defultPageNum : Int = 6   //默认显示数目

fileprivate let cycleImageCellId : String = "cycleImageCellId"
class CycleView: UIView {
    var cycleTimer : Timer?
    var cycleModels :[AnyObject]?
    
    @IBOutlet weak var cycleCollection: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    //MARK: ------- 系统函数
    override func awakeFromNib() {
        cycleCollection.register(UINib(nibName: "ViewCycleCell", bundle: nil), forCellWithReuseIdentifier: cycleImageCellId)
      
        pageControl.numberOfPages = cycleModels?.count ?? defultPageNum
//        先移除timer
        removeTimer()
//        添加timer
        addTimer()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = cycleCollection.collectionViewLayout as! UICollectionViewFlowLayout
       layout.itemSize = cycleCollection.bounds.size
        let indexPath = NSIndexPath(item: (cycleModels?.count ?? defultPageNum) * 10, section: 0)
        cycleCollection.scrollToItem(at: indexPath as IndexPath, at: .left, animated: false)
    }
}
//MARK: ------- 创建
extension CycleView {
    class func cycleView() -> CycleView {
        return Bundle.main.loadNibNamed("CycleView", owner: nil, options: nil)?.first as! CycleView
    }
}
//MARK: ------- UICollectionView 代理
extension CycleView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (cycleModels?.count ?? defultPageNum) * 10000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cycleImageCellId, for: indexPath) as! ViewCycleCell
        cell.img.backgroundColor = UIColor.randomColor()
        return cell
    }
    
    
}

extension CycleView : UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSetx = scrollView.contentOffset.x
        pageControl.currentPage = Int(offSetx / scrollView.bounds.width) % (cycleModels?.count ?? defultPageNum)
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeTimer()
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        addTimer()
    }
    
}
//MARK: ------- 定时器--相关3
extension CycleView {
    fileprivate func addTimer() {
        cycleTimer = Timer(timeInterval: 1.5, target: self, selector: #selector(self.scrollToNext), userInfo: nil, repeats: true)
        RunLoop.main.add(cycleTimer!, forMode: .common)
    }
    
    fileprivate func removeTimer(){
        cycleTimer?.invalidate()
        cycleTimer = nil
    }
    
    
    @objc fileprivate func scrollToNext() {
        let currentOffx = cycleCollection.contentOffset.x
        let offx = currentOffx + cycleCollection.bounds.width
        cycleCollection.setContentOffset(CGPoint(x: offx, y: 0), animated: true)
    }
    
}
