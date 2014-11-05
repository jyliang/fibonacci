//
//  ItemViewModel.swift
//  fibonacci
//
//  Created by Jason Liang on 11/4/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

import UIKit

class ItemViewModel: NSObject {
    var valueList = Array<Int>() //digits stored in an array from the least significant digit to the most

    var value:Int = -1;

    override init() {
        super.init()
    }

    init(value:Int) {
        super.init()
        if (value < 10) {
            self.valueList.append(value)
        } else {
            NSLog("Base initializer is not taking values greater than 1 digit")
        }
    }

    init (prev1:ItemViewModel, prev2:ItemViewModel) {
        super.init()
        Utility.addValueLists(prev1.valueList, list2 : prev2.valueList)
    }

    func populateCell(cell:UITableViewCell) {
        if (self.valueList.count > 0) {
            cell.textLabel.text = Utility.getStringValue(self.valueList)
        } else {
            cell.textLabel.text = "calculating..."
        }
    }
}
