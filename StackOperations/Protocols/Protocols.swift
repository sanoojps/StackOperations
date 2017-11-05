//
//  Protocols.swift
//  StackOperations
//
//  Created by sanooj on 11/5/17.
//

import Foundation
import UIKit.UIViewController
import UIKit.UITableViewCell

//MARK: - Protocols
//MARK: - Bevaiour Abstraction of Stack Data Structure
/*
 Represents Basic "stack" operations
 */
protocol StackOperation
{
    associatedtype Element
    
    var isEmpty: Bool {get}
    
    var count: Int {get}
    
    //LIFO
    mutating func push(_ element: Element)
    
    @discardableResult
    mutating func pop() -> Element?
    
    func peek() -> Element?
    
    //special method to access a object at index
    func object(atIndex index:Int) -> Element?
    
    mutating func sort()
    
    mutating func clear()
}


//MARK: - Configure TableViewCell
//Protocol that defines  a abstract common API that can be used/implemented by any
//tableview data source to configure its tableview cell
protocol ConfigureTableViewCell
{
    associatedtype Element:Comparable
    
    //weak reference to the view controller that houses the table view
    weak var parentController:UIViewController? {get set}
    
    //main method that can be inplemented to customise a cell
    func configure(tableViewCell:UITableViewCell,
                   atIndex index:Int,
                   withData data:Stack<Element>,
                   andParent parent:UIViewController?
    )
}

//MARK: - Date Display Cell DataSource Collection
//- Defines a collection type fpr the dataSource classes
//- supports Stack data structure
//- sample implementation at BaseTableViewDataSource
//- usage -> assign a "Stack" object
protocol DateDisplayCellDataSourceCollection
{
    associatedtype Element:Comparable
    var dataSourceCollection: Stack<Element> {get set}
}

//MARK: - Table ViewController Data Access Mediator
//- sample implementation at BaseTableViewDataSource and DateDisplayTableViewDataSource
//- usage -> assign a "BaseTableViewDataSource" object
protocol TableViewControllerDataAccessMediator
{
    associatedtype Element:Comparable
    var dataAccessMediator: BaseTableViewDataSource<Element>? {get set}
}

//MARK: - Data Item Change Propagator Delegate
//- Abstract SPI tp handle button clicks
//- or any change to the View Controller that needs to be propagated to the tableview
protocol DataItemChangePropagatorDelegate
{
    //save the typed in value
    func pushValue(_ date: Date)
    
    //remove a value from stack
    //check for match with the typed in value
    //if not pop last
    func popValue()
    
    //sort ascending
    func sortValue()
    
    //remove all Values
    func clearAllvalues()
    
    func isEmpty() -> Bool
}
