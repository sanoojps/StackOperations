//
//  BaseTableViewDataSource.swift
//  StackOperations
//
//  Created by sanooj on 11/5/17.
//

import UIKit

//Generic Abstract table view datasource class
//Supports any object that implements "Comparable" protocol
//usage - subclass
// ovveride dataSourceCollection with the type of the object
//example usage - refer to "DateDisplayTableViewDataSource"
class BaseTableViewDataSource<T:Comparable>: NSObject, UITableViewDataSource, UITableViewDelegate, DateDisplayCellDataSourceCollection , ConfigureTableViewCell {
    
    //MARK:- Protocol conformance for protocols with Associated Types
    /*
    DateDisplayCellDataSourceCollection
    ConfigureTableViewCell
     */
    typealias Element = T
    
    //MARK:- DateDisplayCellDataSourceCollection Protocol
    var dataSourceCollection: Stack<T> =
        Stack<T>()
    
    
    //MARK:- UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //stub conformance
        return dataSourceCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //stub conformance
        let cell =
            tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) as? BaseTableViewCell
        
        return cell!
    }
    
    //MARK: - ConfigureTableViewCell protocol
    weak var parentController:UIViewController?
    
    func configure(tableViewCell: UITableViewCell, atIndex index:Int,
                   withData data:Stack<Element>,
                   andParent parent:UIViewController?
        )
    {
        //stub conformance
    }
    
    //MARK: - Initialization
    required init(parent:UIViewController)
    {
        self.parentController =
            parent
        
        super.init()
    }
    
}


