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
fileprivate let kTopCellId : String = "kTopCellId"
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
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kTopCellId)
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
extension DiscoveryController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 13
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kTopCellId, for: indexPath)
        cell.contentView.backgroundColor = indexPath.item % 2 == 0 ? UIColor.red : UIColor.green
        return cell
    }
    
    
}
