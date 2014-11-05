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
        var value:String = ""
        for (var i = valueList.count-1; i >= 0; i--) {
            value += "\(valueList[i])"
        }
        return value
    }

}
