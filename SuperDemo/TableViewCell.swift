//
//  TableViewCell.swift
//  SuperDemo
//
//  Created by TJQ on 16/7/23.
//  Copyright © 2016年 KiraMelody. All rights reserved.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    var titleLabel = UILabel()
    var descLabel = UILabel()
    var select: NSIndexPath!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(descLabel)
        titleLabel.font = UIFont.systemFontOfSize(30)
        descLabel.font = UIFont.systemFontOfSize(15)
        titleLabel.snp_makeConstraints { (make) -> Void in
            make.leading.equalTo(contentView).offset(10)
            make.top.equalTo(contentView).offset(10)
            make.bottom.equalTo(descLabel).offset(-10)
        }
        
        descLabel.snp_makeConstraints { (make) -> Void in
            make.leading.equalTo(contentView).offset(10)
            make.bottom.equalTo(contentView).offset(-10)
        }
    }
}
