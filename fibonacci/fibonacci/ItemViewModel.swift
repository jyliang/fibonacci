//
//  ItemViewModel.swift
//  fibonacci
//
//  Created by Jason Liang on 11/4/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

import UIKit

class ItemViewModel: NSObject {
    var value:Int = -1;

    init(value:Int) {
        self.value = value
    }

    init (prev1:ItemViewModel, prev2:ItemViewModel) {
        if (prev1.value < 0 || prev2.value < 0) {
            NSLog("Error!")
        } else {
            self.value = prev1.value + prev2.value
        }
    }

    func populateCell(cell:UITableViewCell) {
        if (self.value < 0) {
            cell.textLabel.text = "?"
        } else {
            cell.textLabel.text = "\(value)"
        }
    }
}
