//
//  ListViewModel.swift
//  fibonacci
//
//  Created by Jason Liang on 11/4/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

import UIKit

class ListViewModel: NSObject {
   var items = Array<ItemViewModel>()

    func initSeedItems() {
        self.items.append(ItemViewModel(value: 1))
        self.items.append(ItemViewModel(value: 1))
        loadMoreItems(20)
    }

    func loadMoreItems(number : Int) {
        NSLog("load more")
        if (self.items.count < 2){
            return
        }
        let baseOffset = items.count - 2
        for (var i = 0; i < number; i++) {
            self.items.append(ItemViewModel(prev1:items[i+baseOffset],prev2:items[baseOffset+1+i]))
        }
    }

}
