//
//  DateDisplayTableViewDataSource.swift
//  StackOperations
//
//  Created by sanooj on 11/5/17.
//

import UIKit

/// concrete sublass of genric BaseTableViewDataSource with datatype "Date"
/// explicitly specified
class DateDisplayTableViewDataSource: BaseTableViewDataSource<Date> {

    //overridden as BaseTableViewDataSource is a generic class
    override var dataSourceCollection: Stack<Date>
    {
        get
        {
            return super.dataSourceCollection
        }
        set(newValue)
        {
            super.dataSourceCollection =
            newValue
        }
    }
    
    //MARK: - Initialization
    required init(parent: UIViewController) {
        super.init(parent: parent)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.dataSourceCollection.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: DateDisplayTableViewCell =
            (tableView.dequeueReusableCell(
                withIdentifier: Constants.Identifiers.TableCellIdentifiers.dateDisplayTableViewCellID,
                for: indexPath
                ) as? DateDisplayTableViewCell)!
        
        self.configure(
            tableViewCell: cell,
            atIndex: indexPath.row,
            withData: dataSourceCollection,
            andParent: self.parentController
        )
        
        return cell
        
    }
    
    //Configure Cell
    override func configure(tableViewCell: UITableViewCell, atIndex index:Int,
                            withData data:Stack<Element>,
                            andParent parent:UIViewController?
        )
    {
        guard let date =
        data.object(atIndex: index) else
        {
            return
        }
        
        let dateString =
            Utilities.Formatters.getStringFrom(date: date)
        
        tableViewCell.textLabel?.text =
        dateString
    }
}


extension DateDisplayTableViewDataSource
{
    
}
