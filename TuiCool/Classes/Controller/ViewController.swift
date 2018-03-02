//
//  ViewController.swift
//  TuiCool
//
//  Created by yuetianlu on 2017/1/11.
//  Copyright © 2017年 yuetianlu. All rights reserved.
//

import UIKit
import MJRefresh
import MBProgressHUD


class ViewController: UIViewController {

    fileprivate lazy var hotVM: HotListViewModel = HotListViewModel()
    fileprivate var page: Int = 1
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        MBProgressHUD.showAdded(to: view, animated: true)
        self.hotVM.loadHotListData(page) { [weak self] in
            self?.tableView.reloadData()
            MBProgressHUD.hide(for: (self?.view)!, animated: true)
        }
        MJRefreshTool.addHeader(tableView, self, refreshingAction: #selector(pullTable))
        MJRefreshTool.addFooter(tableView, self, refreshingAction: #selector(dragLoadMoreData))
        
    }
    

}


extension ViewController {
    //下拉刷新
    @objc fileprivate func pullTable() {
        page = 1
        self.hotVM.loadHotListData(page) { [weak self] in
            self?.tableView.reloadData()
            MJRefreshTool.stopHeader()
        }
        
        print("下拉刷新")
    }
    //上拉加载
    @objc fileprivate func dragLoadMoreData() {
        page += 1
        self.hotVM.loadHotListData(page) { [weak self] in
            self?.tableView.reloadData()
            MJRefreshTool.stopFooter()
        }
        print("下拉加载")
        
    }
    
}





extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotVM.articleModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        
        cell?.model = hotVM.articleModels[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        let detial = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detial") as! DetialViewController
        
//        YYJumpToShareViewController *vc = [story instantiateViewControllerWithIdentifier:@"JumpToShareVC"];
        
//        let detial = DetialViewController()
        detial.articalId = hotVM.articleModels[indexPath.row].id
        
        navigationController?.pushViewController(detial, animated: true)
    }
}





