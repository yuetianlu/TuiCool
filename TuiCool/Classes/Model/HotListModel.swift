//
//  HotListModel.swift
//  TuiCool
//
//  Created by yuetianlu on 2017/1/11.
//  Copyright © 2017年 yuetianlu. All rights reserved.
//

import UIKit

class HotListModel: NSObject {
    var title : String = ""
    var rectime : String = ""
    var feed_title : String = ""
    var img : String = ""
    var id : String = ""
    
    init(dic: [String : Any]) {
        super.init()
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    
}
