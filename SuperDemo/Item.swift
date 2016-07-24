//
//  Item.swift
//  SuperDemo
//
//  Created by TJQ on 16/7/23.
//  Copyright © 2016年 KiraMelody. All rights reserved.
//

import Foundation

class Item: NSObject {
    
    var title = ""
    var desc = ""
    
    override init() {
        title = ""
        desc = ""
    }
    
    init(title: String, desc: String) {
        self.title = title
        self.desc = desc
    }
}
