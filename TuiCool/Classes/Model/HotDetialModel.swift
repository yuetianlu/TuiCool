//
//  HotDetialModel.swift
//  TuiCool
//
//  Created by yuetianlu on 2017/1/12.
//  Copyright © 2017年 yuetianlu. All rights reserved.
//

import UIKit

class HotDetialModel: NSObject {
    var title : String = ""
    var time : String = ""
    var feed_title : String = ""
    var content : String = ""
    
    init(_ dic : [String : Any]) {
        super.init()
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
