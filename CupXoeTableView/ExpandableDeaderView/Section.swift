//
//  Section.swift
//  CupXoeTableView
//
//  Created by Tung Nguyen on 11/15/17.
//  Copyright © 2017 Tung Nguyen. All rights reserved.
//

import Foundation

struct Section {
    var name: String!
    var expan: Bool!
    
    init(name:String, expan: Bool) {
        self.name = name
        self.expan = expan
    }
}
