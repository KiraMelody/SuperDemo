//
//  EditCell.swift
//  SuperDemo
//
//  Created by TJQ on 16/7/25.
//  Copyright © 2016年 KiraMelody. All rights reserved.
//
import UIKit
import SnapKit

protocol TableViewCellDelegate : NSObjectProtocol {
    
    func textDidChange(cell:EditCell,textField: UITextField)
    
}

class EditCell: UITableViewCell,UITextFieldDelegate {
    
    var titleLabel: UILabel = UILabel()
    var inputField: UITextField = UITextField()
    var indexPath: NSIndexPath = NSIndexPath()
    weak var delegate:TableViewCellDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        inputField.delegate = self
        contentView.backgroundColor = UIColor.whiteColor()
        contentView.addSubview(titleLabel)
        contentView.addSubview(inputField)
        
        titleLabel.snp_makeConstraints { (make) -> Void in
            make.leading.equalTo(contentView).offset(10)
            make.width.equalTo(100)
            make.centerY.equalTo(contentView)
        }
        
        inputField.snp_makeConstraints { (make) -> Void in
            make.leading.equalTo(titleLabel.snp_trailing).offset(10)
            make.trailing.equalTo(contentView).offset(-10)
            make.centerY.equalTo(contentView)
        }
        
    }
    
    func textFieldDidEndEditing(textField: UITextField)
    {
        delegate?.textDidChange(self, textField: textField)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

