//
//  ListViewModel.swift
//  fibonacci
//
//  Created by Jason Liang on 11/4/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

import UIKit

protocol ListViewModelDelegate : class {
    func updateCellAtIndex(index:Int)
}

class ListViewModel: NSObject, NumberCalculationDelgate {
    weak var delegate : ListViewModelDelegate?
    var items = Array<ItemViewModel>()
    let operationQueue = NSOperationQueue()

    override init() {
        super.init()
        self.operationQueue.maxConcurrentOperationCount = 1 // all numbers depends on the previous number result
    }

    func initSeedItems() {
        self.items.append(ItemViewModel(value: 1))
        self.items.append(ItemViewModel(value: 1))
        loadMoreItems(20)
    }

    func loadMoreItems(number : Int) {
        if (self.items.count < 2){
            return
        }
        let baseOffset = items.count
        for (var i = 0; i < number; i++) {
            let itemVM = ItemViewModel()
            self.items.append(itemVM)
            let calcOp : NumberCalculationOperation = NumberCalculationOperation()
            calcOp.delegate = self
            calcOp.index = baseOffset+i
            if (self.operationQueue.operations.last != nil) {
            calcOp.addDependency(self.operationQueue.operations.last! as NSOperation)
            }
            self.operationQueue.addOperation(calcOp)
//            self.items.append(ItemViewModel(prev1:items[i+baseOffset],prev2:items[baseOffset+1+i]))
        }
    }


    //MARK: -  NumberCalculationDelgate
    func getItemModelAtIndex(index:Int) -> ItemViewModel {
        return self.items[index]
    }

    func updateValueListAtIndex(index:Int, valueList : Array<Int>) {
        self.items[index].valueList = valueList
    }

    func updateUI(index: Int) {
        if (self.delegate != nil) {
            self.delegate!.updateCellAtIndex(index)
        }
    }
}
