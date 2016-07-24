//
//  ViewControllerExtension.swift
//  SuperDemo
//
//  Created by TJQ on 16/7/23.
//  Copyright © 2016年 KiraMelody. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UISearchResultsUpdating {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (searchView.active){
            return search.count
        }
        else
        {
            return origin.count
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCell", forIndexPath: indexPath) as! TableViewCell
        if searchView.active {
            cell.titleLabel.text = search[indexPath.row].title
            cell.descLabel.text = search[indexPath.row].desc
        }
        else{
            cell.titleLabel.text = origin[indexPath.row].title
            cell.descLabel.text = origin[indexPath.row].desc
        }
        return cell
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let predicate = NSPredicate(format: "SELF CONTAINS[c] %@",searchController.searchBar.text!)
        search.removeAll(keepCapacity: false)
        let result = (origin as NSArray).filteredArrayUsingPredicate(predicate)
        search = result as! [Item]
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }

}