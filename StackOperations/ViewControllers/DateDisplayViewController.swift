//
//  ViewController.swift
//  StackOperations
//
//  Created by sanooj on 11/4/17.
//

import UIKit

class DateDisplayViewController: BaseViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateTextField: UITextField!
    
    //MARK: - Actions
    
    @IBAction func didClickClearButton(_ sender: UIButton)
    {
        self.changePropagatorDelegate?.clearAllvalues()
    }
    
    @IBAction func didClickSortButton(_ sender: UIButton)
    {
        self.changePropagatorDelegate?.sortValue()
    }
    
    @IBAction func didClickPushButton(_ sender: UIButton)
    {
        
        let dateString: String =
        self.dateTextField?.text ?? ""
        
        //empty string validation
        guard !dateString.isEmpty else
        {
            Utilities.Alert.display(
                presenter: self,
                errorMsgTitle:
                Utilities.Localization.localize(key: "EMPTY_STRING_ALERT_MESSAGE"),
                errorMsgBody:
                Utilities.Localization.localize(key: "EMPTY_STRING_ALERT_MESSAGE_BODY")
            )
            
            return
        }
        
        //add current date
        //self.changePropagatorDelegate?.pushValue(Date())
        
        //Validation for date
        if Utilities.Validators.DateValidator.validateDate(dateString, againstFormat: Constants.Formats.DateFormats.ddMMyyyy)
        {
            if let dateFromString: Date =
                Utilities.Formatters.getDateFrom(dateString: dateString)
            {
                self.changePropagatorDelegate?.pushValue(dateFromString)
                return
            }
            else
            {
                Utilities.Alert.display(
                    presenter: self,
                    errorMsgTitle:
                    Utilities.Localization.localize(key: "INCORRECT_DATE_FORMAT_ALERT_MESSAGE"),
                    errorMsgBody:
                    Utilities.Localization.localize(key: "INCORRECT_DATE_FORMAT_ALERT_MESSAGE_BODY")
                )
                
                //add current date
                //self.changePropagatorDelegate?.pushValue(Date())
                return
            }
        }
        else
        {
            Utilities.Alert.display(
                presenter: self,
                errorMsgTitle:
                Utilities.Localization.localize(key: "INCORRECT_DATE_FORMAT_ALERT_MESSAGE"),
                errorMsgBody:
                Utilities.Localization.localize(key: "INCORRECT_DATE_FORMAT_ALERT_MESSAGE_BODY")
            )
            
            //add current date
            //self.changePropagatorDelegate?.pushValue(Date())
            //alert
        }
    
    }
    
    @IBAction func didClickPopButton(_ sender: Any)
    {
        self.changePropagatorDelegate?.popValue()
    }
    
    //MARK: - Change propagater DataItemChangePropagatorDelegate
    var changePropagatorDelegate: DataItemChangePropagatorDelegate? = nil
    
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.dateTextField.delegate =
        self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 // MARK: - Navigation
 // In a storyboard-based application,
 //   you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.destination.isKind(of: DateDisplayTableViewController.self)
        {
            let destination:DateDisplayTableViewController? =
            segue.destination as? DateDisplayTableViewController
            
            //update its data Source
            self.changePropagatorDelegate =
                destination
            
        }
    }
    
}


extension DateDisplayViewController:UITextFieldDelegate
{
    //stub
}
