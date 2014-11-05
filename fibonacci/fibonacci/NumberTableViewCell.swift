//
//  NumberTableViewCell.swift
//  fibonacci
//
//  Created by Jason Liang on 11/4/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

import UIKit

class NumberTableViewCell: UITableViewCell, NumberDisplayOperationDelegate {

    var operationQueue = NSOperationQueue()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.operationQueue.maxConcurrentOperationCount = 1
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func loadItem (item : ItemViewModel) {
        self.operationQueue.cancelAllOperations()
        if (item.valueList.count == 0) {
            self.textLabel.text = "calculating..."
        } else {
            self.textLabel.text = "loading..."
            let displayOp = NumberDisplayOperation()
            displayOp.item = item
            displayOp.delegate = self
            self.operationQueue.addOperation(displayOp)
        }
    }

    //MARK: NumberDisplayOperationDelegate
    func updateResult(text: String) {
        self.textLabel.text = text
    }

}
