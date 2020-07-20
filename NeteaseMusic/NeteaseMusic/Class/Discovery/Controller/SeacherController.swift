//
//  SeacherController.swift
//  NeteaseMusic
//
//  Created by 2020 on 2020/7/19.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit

class SeacherController: UIViewController {
    fileprivate lazy var searchBar : UISearchController = {
        let searchBar = UISearchController(searchResultsController: SearchResultsVC())
        searchBar.searchBar.sizeToFit()
        //默认情况下，UISearchController暗化前一个view，这在我们使用另一个view controller来显示结果时非常有用，但当前情况我们并不想暗化当前view，即设置开始搜索时背景是否显示
        searchBar.dimsBackgroundDuringPresentation = false
        //不隐藏导航栏
        searchBar.hidesNavigationBarDuringPresentation = false
//        设置取消按钮颜色
        searchBar.searchBar.tintColor = UIColor.black
        //设置默认显示内容
        searchBar.searchBar.placeholder = "我是测试数据"
        searchBar.searchBar.searchBarStyle = .minimal
      
        //设置searchBar自适应大小
        searchBar.searchBar.sizeToFit()
        //设置definesPresentationContext为true，我们保证在UISearchController在激活状态下用户push到下一个view controller之后search bar不会仍留在界面上。
        searchBar.definesPresentationContext = true
//        searchBar.isEditing = true
        searchBar.searchResultsUpdater = self
        searchBar.delegate = self
        //设置searchBar的代理
        searchBar.searchBar.delegate = self
        return searchBar
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "cm6_search_singers_baritem")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(self.clickSingers))
        navigationItem.titleView = searchBar.searchBar
        //隐藏返回按钮
        navigationItem.hidesBackButton = true
        searchBar.isActive = true
    }
   

}
extension SeacherController {
    @objc fileprivate func clickSingers() {
        print("----")
    }
}

extension SeacherController : UISearchBarDelegate {

//    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
//
//    }
//    // called when text starts editing
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar){
//
//    }
//
//    // return NO to not resign first responder
//    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
//
//    }
    // called when text ends editing
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar){
        
    }
    // called when text changes (including clear)
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }

//    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool{
//
//    } // called before text changes


    func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
        navigationController?.popViewController(animated: true)
    } // called when cancel button pressed


    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        
    }// called when search results button pressed

  
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int){
        
    }
}
extension SeacherController :UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        searchController.searchBar.showsCancelButton=true
       
//        searchController.searchBar.setValue("搜索", forKey:"_cancelButtonText")
        // 找到子类中 UIButton 类型的属性，然后设置其标题
        
        let searchString = searchController.searchBar.text
        print(searchString ?? "")
    }
}
extension SeacherController : UISearchControllerDelegate {
    //设置搜索框为第一响应者
    func didPresentSearchController(_ searchController: UISearchController){
        UIView.animate(withDuration: 0.1, animations: {}) { (finished) in
            searchController.searchBar.becomeFirstResponder()
        }
    }
}
