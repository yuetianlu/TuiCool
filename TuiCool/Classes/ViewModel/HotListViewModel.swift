//
//  HotListViewModel.swift
//  TuiCool
//
//  Created by yuetianlu on 2017/1/11.
//  Copyright © 2017年 yuetianlu. All rights reserved.
//

import UIKit
import Alamofire

class HotListViewModel: NSObject {

    lazy var articleModels: [HotListModel] = Array()
    
}

extension HotListViewModel {
//    NSDictionary *nameAndPassWord = @{
//    @"email":self.emailTextField.text,
//    @"password":self.passWordTextField.text
//    };
    
//    func login(_ completion: @escaping () -> ()) {
//        let parameter = ["email": "yuetianlu_kyy@163.com",
//                         "password": "123456"]
//        NetworkTool.requestData("http://api.tuicool.com/api/login.json", .post, parameters: parameter) { response in
//            
////            guard let response = response as? [String : Any] else { return }
////            guard let user = response["user"] as? [String : Any] else { return }  
//            
//            
//            completion()
//            
//        }
//    }
    func loadHotListData(_ page: Int, _ completion: @escaping () -> ()) {
        if page == 1 {
            articleModels.removeAll()
        }
        let urlStr = "http://api.tuicool.com/api/articles/hot.json?cid=0&size=\(30 * page)"
        
        let request = Alamofire.request(urlStr, method: .get, parameters: nil).responseJSON { response in
            
            guard let result = response.result.value else {
                print(response.result.error!)
                return
            }
            guard let respons = result as? [String : Any] else { return }
            print(respons)
            guard let articles = respons["articles"] as? [[String : Any]] else { return }
            
            for dic in articles {
                let model = HotListModel(dic: dic)
                self.articleModels.append(model)
            }
            completion()
            
        }
        
        request.authenticate(user: "yuetianlu_kyy@163.com" , password: "123456")
    }
    
    
    
}






