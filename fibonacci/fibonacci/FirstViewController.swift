//
//  FirstViewController.swift
//  fibonacci
//
//  Created by Jason Liang on 11/4/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var listVM = ListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
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
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        let item = self.listVM.items[indexPath.item]
        item.populateCell(cell)
        return cell
    }

    //MARK: - Delegates
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

    }
}

