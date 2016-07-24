//
//  Detail.swift
//  SuperDemo
//
//  Created by TJQ on 16/7/24.
//  Copyright © 2016年 KiraMelody. All rights reserved.
//

import UIKit

class Detail: UIViewController {
    var titleLabel = UILabel()
    var descLabel = UILabel()
    var selectIndexPath : NSIndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        view.addSubview(titleLabel)
        view.addSubview(descLabel)
        titleLabel.font = UIFont.systemFontOfSize(50)
        descLabel.font = UIFont.systemFontOfSize(30)
        titleLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(10)
            make.bottom.equalTo(descLabel).offset(-20)
        }
        
        descLabel.snp_makeConstraints { (make) -> Void in
            make.leading.equalTo(view).offset(10)
            make.bottom.equalTo(view).offset(-10)
        }
    }
    
}
