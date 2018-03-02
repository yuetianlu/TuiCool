//
//  MJRefreshTool.swift
//  TuiCool
//
//  Created by yuetianlu on 2017/1/12.
//  Copyright © 2017年 yuetianlu. All rights reserved.
//

import UIKit
import MJRefresh


class MJRefreshTool: NSObject {
    static fileprivate var view: UIScrollView?
}

extension MJRefreshTool {
    
    class func addHeader(_ view: UIScrollView, _ target: Any, refreshingAction: Selector) {
        self.view = view
        view.mj_header = MJRefreshNormalHeader.init(refreshingTarget: target, refreshingAction: refreshingAction)
    
    }
    
    
    class func addFooter(_ view: UIScrollView, _ target: Any, refreshingAction: Selector) {
        self.view = view
        view.mj_footer = MJRefreshBackNormalFooter.init(refreshingTarget: target, refreshingAction: refreshingAction)
    
    }
    
    class func stopHeader() {
        guard let view = view else {
            return
        }
        view.mj_header.endRefreshing()
    }
    
    class func stopFooter() {
        guard let view = view else {
            return
        }
        view.mj_footer.endRefreshing()
    }
    
    
}




