//
//  ViewController.swift
//  SuperDemo
//
//  Created by TJQ on 16/7/23.
//  Copyright © 2016年 KiraMelody. All rights reserved.
//

import UIKit


class ViewController: UITableViewController {

    //var tableView:UITableView!
    
    var searchView = UISearchController()
    
    var origin: [Item] = [Item(title: "a",desc: "aaa")]
    
    var search = [Item](){
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: UIScreen.mainScreen().bounds,style:UITableViewStyle.Plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.title = "搜索"
        let editItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add,target:self,action:"add");
        self.navigationItem.rightBarButtonItem = editItem

        tableView.registerClass(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        searchView = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.hidesNavigationBarDuringPresentation = false
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.searchBarStyle = .Minimal
            controller.searchBar.sizeToFit()
            tableView.tableHeaderView = controller.searchBar
            return controller
        })()
    }
    
    func add ()
    {
        print("add")
        let dvc = EditTableViewController();
        self.navigationController!.pushViewController(dvc,animated:true);
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = Detail();
        vc.selectIndexPath = indexPath
        self.navigationController!.pushViewController(vc,animated:true);
    }

}

