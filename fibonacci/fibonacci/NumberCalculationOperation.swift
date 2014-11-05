//
//  NumberCalculationOperation.swift
//  fibonacci
//
//  Created by Jason Liang on 11/4/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

import UIKit

protocol NumberCalculationDelgate : class {
    func getItemModelAtIndex(index:Int) -> ItemViewModel
    func updateValueListAtIndex(index:Int, valueList : Array<Int>)
    func updateUI(index:Int)
}

class NumberCalculationOperation: NSOperation {

    weak var delegate : NumberCalculationDelgate?
    var index : Int = 2

    override func main() {
        autoreleasepool { () -> () in


            if (self.delegate != nil) {
                var prevItem1 : ItemViewModel?
                var prevItem2 : ItemViewModel?
                var currentItem : ItemViewModel?

                dispatch_sync(dispatch_get_main_queue(), { () -> Void in
                    prevItem1 = self.delegate!.getItemModelAtIndex(self.index-1)
                    prevItem2 = self.delegate!.getItemModelAtIndex(self.index-2)
                    currentItem = self.delegate!.getItemModelAtIndex(self.index)
                })

                let valueList : Array<Int> = Utility.addValueLists(prevItem1!.valueList, list2: prevItem2!.valueList)
                let result = Utility.getStringValue(valueList)
                dispatch_sync(dispatch_get_main_queue(), { () -> Void in
                    self.delegate!.updateValueListAtIndex(self.index, valueList:valueList)
                    self.delegate!.updateUI(self.index)
                })

            }

            if (self.cancelled) {
                
            }
        }

    }
}
