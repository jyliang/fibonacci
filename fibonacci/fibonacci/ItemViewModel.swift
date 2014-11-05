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

    init(value:Int) {
        if (value < 10) {
            self.valueList.append(value)
        } else {
            NSLog("Base initializer is not taking values greater than 1 digit")
        }
    }

    init (prev1:ItemViewModel, prev2:ItemViewModel) {
        super.init()
        addValueLists(prev1.valueList, list2 : prev2.valueList)
//        if (prev1.value < 0 || prev2.value < 0) {
//            NSLog("Error!")
//        } else {
//            self.value = prev1.value + prev2.value
//        }
    }

    func addValueLists (list1 : Array<Int>, list2 : Array<Int>) {
        let maxDigit = list1.count > list2.count ? list1.count : list2.count
        var result = 0
        var list1Digit = 0
        var list2Digit = 0
        var carry = 0
        for (var i = 0; i < maxDigit; i++) {
            list1Digit = i < list1.count ? list1[i] : 0
            list2Digit = i < list2.count ? list2[i] : 0
            result = list1Digit + list2Digit + carry
            if (result > 9) {
                carry = 1
                self.valueList.append(result%10)
            } else {
                carry = 0
                self.valueList.append(result)
            }
        }
        if (carry > 0) {
            self.valueList.append(carry)
        }
    }

    func populateCell(cell:UITableViewCell) {
//        if (self.value < 0) {
//            cell.textLabel.text = "?"
//        } else {
        cell.textLabel.text = Utility.getStringValue(self.valueList)
        // "\(self.valueList)"
//        }
    }
}
