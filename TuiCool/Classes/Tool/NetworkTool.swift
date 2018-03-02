//
//  NetworkTool.swift
//  TuiCool
//
//  Created by yuetianlu on 2017/1/11.
//  Copyright © 2017年 yuetianlu. All rights reserved.
//

import UIKit
import Alamofire

enum HTTPMethodType {
    case get
    case post
}


class NetworkTool {

    class func requestData(_ urlString: String, _ type: HTTPMethodType, parameters: [String : Any]? = nil, finishedCallback: @escaping (_ result: Any) -> ()) {
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(urlString, method: method, parameters: parameters).responseJSON { (response) in
            
            // 3.获取结果
            guard let result = response.result.value else {
                print(response.result.error!)
                return
            }
            
            // 4.将结果回调出去
            finishedCallback(result)
        }
        
    }
}
