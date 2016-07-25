//
//  EditTableViewController.swift
//  SuperDemo
//
//  Created by TJQ on 16/7/25.
//  Copyright © 2016年 KiraMelody. All rights reserved.
//

import UIKit

class EditTableViewController: UITableViewController,TableViewCellDelegate {

    var text=["标题","描述"]
    var delegate: UITableViewDelegate?
    
    var TitleName:String = ""
    var Desc:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(EditCell.self, forCellReuseIdentifier: "EditCell")

        self.title = "添加项目";

    }
    
    // MARK: - Table view data source
    
    func fetch(item: Item)
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let saved = defaults.objectForKey("item") as? NSData {
            var data = NSKeyedUnarchiver.unarchiveObjectWithData(saved) as? [Item] ?? [Item]()
            data.append(item)
            let savedData = NSKeyedArchiver.archivedDataWithRootObject(data)
            defaults.setObject(savedData, forKey: "item")
        }
        else
        {
            var data = [Item]()
            data.append(item)
            let savedData = NSKeyedArchiver.archivedDataWithRootObject(data)
            defaults.setObject(savedData, forKey: "item")
            defaults.synchronize()
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EditCell", forIndexPath: indexPath) as! EditCell
        cell.titleLabel.text = text[indexPath.row]
        cell.indexPath = indexPath
        cell.delegate = self
        switch indexPath.row
        {
        case 0: cell.inputField.placeholder = "请输入标题"
        case 1: cell.inputField.placeholder = "请输入描述"
        default:break
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var footerView : UIView?
        footerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 50))
        footerView?.backgroundColor = UIColor.whiteColor()
        
        let userButton = UIButton(type: UIButtonType.System)
        userButton.setTitle("确认", forState: UIControlState.Normal)
        userButton.frame = CGRectMake(0, 0, 100, 50)
        userButton.addTarget(self, action: "buttonTouched:", forControlEvents: UIControlEvents.TouchUpInside)
        footerView?.addSubview(userButton)
        userButton.translatesAutoresizingMaskIntoConstraints = false
        let constraintButtonCenterX = NSLayoutConstraint(item: userButton, attribute: .CenterX, relatedBy: .Equal, toItem: footerView, attribute: .CenterX, multiplier: 1.0, constant: 0)
        let constraintButtonCenterY = NSLayoutConstraint(item: userButton, attribute: .CenterY, relatedBy: .Equal, toItem: footerView, attribute: .CenterY, multiplier: 1.0, constant: 0)
        footerView?.addConstraints([constraintButtonCenterX,constraintButtonCenterY])
        
        return footerView
    }
    
    func buttonTouched(sender:UIButton!)
    {
        print("click")
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    
    func textDidChange(cell: EditCell, textField: UITextField) {
        switch cell.indexPath.row
        {
        case 0:TitleName = textField.text!
        case 1:Desc = textField.text!
        default: break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
