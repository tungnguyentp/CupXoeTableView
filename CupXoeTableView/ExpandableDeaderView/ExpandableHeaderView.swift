//
//  ExpandableHeaderView.swift
//  CupXoeTableView
//
//  Created by Tung Nguyen on 11/15/17.
//  Copyright © 2017 Tung Nguyen. All rights reserved.
//

import UIKit

class ExpandableHeaderView: UITableViewHeaderFooterView {
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
      
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(tapRecognizer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleTap(gestureRecognizer: UIGestureRecognizer){
        print("tung")
    }

    
}
