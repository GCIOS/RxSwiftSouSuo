//
//  Hero.swift
//  sousuo
//
//  Created by 高崇 on 17/3/29.
//  Copyright © 2017年 LieLvWang. All rights reserved.
//

import UIKit

class Hero: NSObject {
    var name: String
    var desc: String
    var icon: String
    
    init(name: String, desc: String, icon: String) {
        self.name = name
        self.desc = desc
        self.icon = icon
    }
}
