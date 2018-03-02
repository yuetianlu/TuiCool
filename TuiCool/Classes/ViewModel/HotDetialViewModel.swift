//
//  HotDetialViewModel.swift
//  TuiCool
//
//  Created by yuetianlu on 2017/1/12.
//  Copyright © 2017年 yuetianlu. All rights reserved.
//

import UIKit
import Foundation

class HotDetialViewModel: NSObject {
    
}

extension HotDetialViewModel {
    
    func loadDetialData(_ articalId: String, _ complication: @escaping (String) -> ()) {
        let urlStr = "http://api.tuicool.com/api/articles/\(articalId).json?is_pad=1&need_image_meta=1"
        NetworkTool.requestData(urlStr, .get) { response in
            guard let response = response as? [String : Any] else { return }
            guard let article = response["article"] as? [String : Any] else { return }
            let content = article["content"] as! String
            print(content)
//            let model = HotDetialModel(article)
            let title = article["title"] as! String
            let time = article["time"] as! String
            let feed_title = article["feed_title"] as! String
            
            let htmlTitle = "<div id=\"mainTitle\">\(title)</div>"
            
            let css = Bundle.main.url(forResource: "HTMLCSS", withExtension: "css")
            let style = "<link href=\"\(css!)\" rel=\"stylesheet\">"
            
            let htmlSub = "<div id=\"subTitle\"><span class=\"feed_title\">\(feed_title)</span><span class=\"time\">\(time)</span></div>"
            let html = "<html><head>\(style)</head><body\">\(htmlTitle)\(htmlSub)\(content)</body></html>"
            complication(html)
        }
    }

}

