//
//  DetialViewController.swift
//  TuiCool
//
//  Created by yuetianlu on 2017/1/12.
//  Copyright © 2017年 yuetianlu. All rights reserved.
//

import UIKit
import MBProgressHUD

class DetialViewController: UIViewController {

    fileprivate lazy var hotDetialVM: HotDetialViewModel = HotDetialViewModel()
    var articalId = ""
    
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        MBProgressHUD.showAdded(to: view, animated: true)
        weak var __self = self
        hotDetialVM.loadDetialData(articalId) { content in
            __self?.webView.loadHTMLString(content, baseURL: nil)
            MBProgressHUD.hide(for: (__self?.view)!, animated: true)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetialViewController: UIWebViewDelegate {
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        
        
        return true
    }
    
    
    
}







