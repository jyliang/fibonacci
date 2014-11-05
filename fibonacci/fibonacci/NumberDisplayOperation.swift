//
//  NumberDisplayOperation.swift
//  fibonacci
//
//  Created by Jason Liang on 11/4/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

import UIKit

protocol NumberDisplayOperationDelegate : class {
    func updateResult(text : String)
}

class NumberDisplayOperation: NSOperation {
    weak var delegate : NumberDisplayOperationDelegate?
    var item : ItemViewModel?
    override func main() {
        autoreleasepool { () -> () in
            if (self.cancelled) {
                return
            }
            var text = ""
            if (self.item != nil) {
                text = Utility.getStringValue(self.item!.valueList)
            }
            if (self.cancelled) {
                return
            }
            if (self.delegate != nil) {
                dispatch_sync(dispatch_get_main_queue(), { () -> Void in
                    self.delegate!.updateResult(text)
                })
            }

        }
    }

}
