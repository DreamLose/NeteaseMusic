//
//  DiscoveryTopViewCell.swift
//  NeteaseMusic
//
//  Created by 2020 on 2020/7/20.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit

class DiscoveryTopViewCell: UICollectionViewCell {
    fileprivate lazy var cycleView : CycleView = {
        let cycleView = CycleView.cycleView()
        return cycleView
    }()
    fileprivate lazy var commonView : CommonView = {
        let commonView = CommonView.commonView()
        return commonView
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        cycle.addSubview(cycleView)
        commonV.addSubview(commonView)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        cycleView.snp.makeConstraints { (maker) in
            maker.size.equalToSuperview()
        }
        commonView.snp.makeConstraints { (maker) in
            maker.size.equalToSuperview()
        }
////        cycleView.frame = cycle.frame
//        commonView.frame = commonV.frame
    }
    @IBOutlet weak var commonV: UIView!
    @IBOutlet weak var cycle: UIView!
}
