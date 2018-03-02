//
//  KingFisherExtension.swift
//  TuiCool
//
//  Created by yuetianlu on 2017/1/11.
//  Copyright © 2017年 yuetianlu. All rights reserved.
//

import UIKit
import Kingfisher



extension UIImageView {
    func setImage(_ URLString : String?, _ placeHolderName : String? = nil) {
        guard let URLString = URLString else {
            return
        }

        guard let url = URL(string: URLString) else {
            return
        }

        guard let placeHolderName = placeHolderName else {
            kf.setImage(with: url)
            return
        }

        kf.setImage(with: url, placeholder : UIImage(named: placeHolderName))
    }
}
