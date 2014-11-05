//
//  FirstViewController.swift
//  fibonacci
//
//  Created by Jason Liang on 11/4/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ListViewModelDelegate {

    let loadmoreThreshold : CGFloat = 100
    var listVM = ListViewModel()
    let cellHeight : CGFloat = 44

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        listVM.delegate = self
        listVM.initSeedItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: - Data Source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listVM.items.count;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as NumberTableViewCell
        let item = self.listVM.items[indexPath.item]
        cell.tag = indexPath.item
//        item.populateCell(cell)
        cell.loadItem(item)
        return cell
    }

    //MARK: - Delegates
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = self.listVM.items[indexPath.item]
        let value = Utility.getStringValue(item.valueList)
        let alert = UIAlertView(title: "Value of fibonacci number #\(indexPath.item+1)", message: "\(value)", delegate: nil, cancelButtonTitle: "OK")
        alert.show()
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        if (scrollViewReachedThreshold(scrollView)) {
            self.loadMore()
        }
    }

    func loadMore() {
        var insertionRows = Array<NSIndexPath>()
        let count = 20
        let base = self.listVM.items.count
        for (var i = 0; i < count; i++) {
            insertionRows.append(NSIndexPath(forItem: i+base, inSection: 0))
        }
        self.listVM.loadMoreItems(count)

        self.tableView.beginUpdates()
        self.tableView.insertRowsAtIndexPaths(insertionRows, withRowAnimation: UITableViewRowAnimation.None)
        self.tableView.endUpdates()
    }

    func scrollViewReachedThreshold(scrollView : UIScrollView) -> Bool {
        let threshold = (CGFloat(self.listVM.items.count) * self.cellHeight - CGRectGetHeight(scrollView.frame)-scrollView.contentOffset.y)
        return threshold < loadmoreThreshold
    }

    //MARK: - ListViewModelDelegate
    func updateCellAtIndex(index: Int) {
        for (cellIndex, element) in enumerate(self.tableView.visibleCells()) {
            if (element.tag == index) {
                let item = self.listVM.items[index]
                if (element.isKindOfClass(NumberTableViewCell)) {
                    let cell = element as NumberTableViewCell
                    cell.loadItem(item)
                }
                return
            }
        }
    }
}

