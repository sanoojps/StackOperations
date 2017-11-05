//
//  DateDisplayTableViewController.swift
//  StackOperations
//
//  Created by sanooj on 11/5/17.
//

import UIKit

class DateDisplayTableViewController: BaseTableViewController<Date> {

    /// dataAccessMediator.
    ///
    /// - oveoverriden to support Date
    ///
    override var dataAccessMediator: BaseTableViewDataSource<Date>?
    {
        get
        {
            return super.dataAccessMediator
        }
        set
        {
            super.dataAccessMediator =
            newValue
        }
    }

    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //initialize the dataAccess mediator
        self.dataAccessMediator =
        DateDisplayTableViewDataSource(parent: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //replace data sources and delegates
        self.tableView?.dataSource =
            self.dataAccessMediator
        
        self.tableView?.delegate =
            self.dataAccessMediator
        
        self.tableView?.reloadData()
        
    }
}


//MARK: - DataItemChangePropagatorDelegate
extension DateDisplayTableViewController:DataItemChangePropagatorDelegate
{
    func pushValue(_ date:Date)
    {
        self.dataAccessMediator?.dataSourceCollection.push(date)
        
        //reload tableview
        self.tableView.reloadData()
    }
    
    func popValue()
    {
        guard let dataSourceCollection = self.dataAccessMediator?.dataSourceCollection ,
            !dataSourceCollection.isEmpty else
        {
            return
        }
        
        self.dataAccessMediator?.dataSourceCollection.pop()
        
        //reload tableview
        self.tableView.reloadData()
    }
    
    func sortValue()
    {
        guard let dataSourceCollection = self.dataAccessMediator?.dataSourceCollection ,
            !dataSourceCollection.isEmpty else
        {
            return
        }
        
        self.dataAccessMediator?.dataSourceCollection.sort()
        
        //reload tableview
        self.tableView.reloadData()
    }
    
    func clearAllvalues()
    {
        guard let dataSourceCollection = self.dataAccessMediator?.dataSourceCollection ,
            !dataSourceCollection.isEmpty else
        {
            return
        }
        
        self.dataAccessMediator?.dataSourceCollection.clear()
        
        //reload tableview
        self.tableView.reloadData()
    }
    
    func isEmpty() -> Bool
    {
        return self.dataAccessMediator?.dataSourceCollection.isEmpty ?? true
    }
}
