//
//  DiscoveryController.swift
//  NeteaseMusic
//
//  Created by 2020 on 2020/7/18.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit
import SnapKit
fileprivate let KTopStaticCellH : CGFloat = KScreenW *  17 / 25
fileprivate let KRecommendSongCellH : CGFloat = KScreenW * 2 / 5
fileprivate let KRecommendEntityCellH : CGFloat = KScreenW * 27 / 50
fileprivate let kTopCellId : String = "kTopCellId"
fileprivate let DiscoveryTopViewCellID : String = "DiscoveryTopViewCellID"
fileprivate let RecommendSongViewCellID : String = "RecommendSongViewCellID"
fileprivate let RecommendEntityCellID : String = "RecommendEntityCellID"
fileprivate let MusicCalendarCellID : String = "MusicCalendarCellID"
class DiscoveryController: UIViewController {
    //MARK: ------- 导航栏搜索框 待优化
    fileprivate lazy var searchText : UIView = {
        let searchView = UIView()
        searchView.backgroundColor = UIColor(r: 247, g: 247, b: 247)
        searchView.frame = CGRect(x: 0, y:0 , width: KScreenW - 100, height: 40)
        searchView.layer.cornerRadius = 15
        searchView.layer.masksToBounds = true
        //  添加文字
        let textLab = UILabel()
        searchView.addSubview(textLab)
        textLab.text = "我是测试的占位符"
        textLab.textAlignment = .center
        textLab.textColor = UIColor(r: 202, g: 202, b: 202)
        textLab.font = UIFont.systemFont(ofSize: 14)
        textLab.sizeToFit()
        textLab.center = searchView.center
        //添加搜索图标
        let imageView = UIImageView(image: UIImage(named: "cm2_topbar_icn_search"))
        searchView.addSubview(imageView)
        imageView.snp.makeConstraints { (maker) in
            maker.centerY.equalTo(textLab)
            maker.size.equalTo(20)
            maker.right.equalTo(textLab.snp_leftMargin).offset(-10)
        }
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(self.viewClick(tap:)))
        searchView.addGestureRecognizer(tapGes)
        searchView.isUserInteractionEnabled = true
        
        return searchView
    }()
    
    fileprivate lazy var collection : UICollectionView = { [weak self] in
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: KScreenW, height: KTopStaticCellH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collection.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        collection.dataSource = self
        collection.delegate = self
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kTopCellId)
        collection.register(UINib(nibName: "DiscoveryTopViewCell", bundle: nil), forCellWithReuseIdentifier: DiscoveryTopViewCellID)
        collection.register(UINib(nibName: "RecommendSongViewCell", bundle: nil), forCellWithReuseIdentifier: RecommendSongViewCellID)
        collection.register(UINib(nibName: "RecommendEntityCell", bundle: nil), forCellWithReuseIdentifier: RecommendEntityCellID)
        collection.register(UINib(nibName: "MusicCalendarCell", bundle: nil), forCellWithReuseIdentifier: MusicCalendarCellID)
        collection.backgroundColor = UIColor.white
        
        return collection
    }()
    
//MARK: ------- 系统回调
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        view.backgroundColor = UIColor.white
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.shadowImage = UIImage() //让黑线消失的方法
    }
    @objc func viewClick(tap:UITapGestureRecognizer) {
        
        navigationController?.pushViewController(SeacherController(), animated: true)
    }
}

//MARK: ------- 设置UI
extension DiscoveryController {
    fileprivate func setUpUI(){
        //设置导航栏
        setUpNavigationBar()
//        let btn = UIButton()
//        btn.setTitle("占位图", for: .normal)
//        btn.sizeToFit()
//        UIApplication.shared.keyWindow?.addSubview(btn)
//        btn.snp.makeConstraints { (make) in
//            make.top.equalToSuperview().offset(15)
//            make.right.equalToSuperview().offset(-15)
//        }
        view.addSubview(collection)
    }
    fileprivate func setUpNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "cm6_nav_icn_mic")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(self.leftBarItemClick))
        navigationItem.titleView = searchText
    }
}
//MARK: ------- 导航栏点击
extension DiscoveryController {
    @objc fileprivate func leftBarItemClick(){
        
    }
}


//MARK: ------- UICOllectionDelegate
extension DiscoveryController : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 13
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoveryTopViewCellID, for: indexPath) as! DiscoveryTopViewCell
            return cell
        }
        if indexPath.item == 1 || indexPath.item == 4 || indexPath.item == 5 || indexPath.item == 6 || indexPath.item == 8 || indexPath.item == 10 || indexPath.item == 12 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendSongViewCellID, for: indexPath) as! RecommendSongViewCell
            return cell
        }
        if indexPath.item == 2 || indexPath.item == 7 || indexPath.item == 9 || indexPath.item == 11 {
//            自定义分页滑动速度过快带优化
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendEntityCellID, for: indexPath) as! RecommendEntityCell
            return cell
        }
        if indexPath.item == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicCalendarCellID, for: indexPath) as! MusicCalendarCell
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kTopCellId, for: indexPath)
        cell.contentView.backgroundColor = indexPath.item % 2 == 0 ? UIColor.red : UIColor.green
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           if indexPath.item == 0 {
               return CGSize(width: KScreenW, height: KTopStaticCellH)
           }
            if indexPath.item == 2 || indexPath.item == 7 || indexPath.item == 9 || indexPath.item == 11  {
                return CGSize(width: KScreenW, height: KRecommendEntityCellH)
            }
            if indexPath.item == 3 {
                return CGSize(width: KScreenW, height: 140)
            }
           return CGSize(width: KScreenW, height: KRecommendSongCellH)
       }
    
}
