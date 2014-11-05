//
//  Utility.swift
//  fibonacci
//
//  Created by Jason Liang on 11/4/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

import UIKit

class Utility: NSObject {

    class func getStringValue(valueList : Array<Int>) -> String {
        if (valueList.count == 0) {
            return ""
        }
        var value:String = ""
        for (var i = valueList.count-1; i >= 0; i--) {
            value += "\(valueList[i])"
        }
        return value
    }

    class func addValueLists (list1 : Array<Int>, list2 : Array<Int>) -> Array<Int> {
        var valueList = Array<Int>()
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
                valueList.append(result%10)
            } else {
                carry = 0
                valueList.append(result)
            }
        }
        if (carry > 0) {
            valueList.append(carry)
        }
        return valueList
    }

}
