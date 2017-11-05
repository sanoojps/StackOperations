//
//  BaseTableViewController.swift
//  StackOperations
//
//  Created by sanooj on 11/5/17.
//

import UIKit

/// Base class for Table View Controllers.
/// Contains only stub implmentations.
/// Need to be subclassed.
///
/// Conforms to : `TableViewControllerDataAccessMediator` protocol

class BaseTableViewController<T:Comparable>: UITableViewController ,TableViewControllerDataAccessMediator {
    
    //protocol conformance TableViewControllerDataAccessMediator
    typealias Element = T
    
    var dataAccessMediator:BaseTableViewDataSource<T>? =
    nil
    
    //init from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //replace data sources and delegates
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return self.dataSourceCollection.count
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 1
//    }
//
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell =
//            tableView.dequeueReusableCell(
//                withIdentifier: Identifiers.TableCellIdentifiers.dateDisplayTableViewCellID,
//                for: indexPath
//        )
//
//        // Configure the cell...
//
//        return cell
//    }
//
//
//    /*
//    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    */
//
//    /*
//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
//    */
//
//    /*
//    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
//    */
//
//    /*
//    // Override to support conditional rearranging of the table view.
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
//    */
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */

}
