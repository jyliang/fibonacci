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
        for (var i = 0; i < 20; i++ ){
            self.items.append(ItemViewModel(prev1:items[i],prev2:items[i+1]))
        }
    }


}
