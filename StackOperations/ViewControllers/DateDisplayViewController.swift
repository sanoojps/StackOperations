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
        //clear typed text
        self.dateTextField.text =
            ""
        
        self.alertForEmptyStack()
        self.changePropagatorDelegate?.clearAllvalues()
    }
    
    @IBAction func didClickSortButton(_ sender: UIButton)
    {
        self.alertForEmptyStack()
        self.changePropagatorDelegate?.sortValue()
    }
    
    @IBAction func didClickPushButton(_ sender: UIButton)
    {
        
        let dateString: String =
        self.dateTextField?.text ?? ""
        
        if isDataValid(dateString: dateString)
        {
            let dateFromString: Date =
                Utilities.Formatters.getDateFrom(dateString: dateString)!
            
            self.changePropagatorDelegate?.pushValue(dateFromString)
        }
    
    }
    
    @IBAction func didClickPopButton(_ sender: Any)
    {
        self.alertForEmptyStack()
        
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
}


extension DateDisplayViewController
{
    
    func handleDataValidation(dateString:String) -> Bool
    {
        //Validation for date
        if Utilities.Validators.DateValidator.validateDate(dateString, againstFormat: Constants.Formats.DateFormats.ddMMyyyy)
        {
            if let _: Date =
                Utilities.Formatters.getDateFrom(dateString: dateString)
            {
                return true
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
                
                return false
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
            
            return false
        }
    }
    
    func handleEmptyStringValidation(dateString:String) -> Bool
    {
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
            
            return false
        }
        
        return true
    }
    
    func isDataValid(dateString:String) ->Bool
    {
        guard self.handleEmptyStringValidation(dateString: dateString) else
        {
            return false
        }
        
        guard self.handleDataValidation(dateString: dateString) else
        {
            return false
        }
        
        return true
    }
 
    func alertForEmptyStack()
    {
        if let changePropagatorDelegate = self.changePropagatorDelegate,
            changePropagatorDelegate.isEmpty()
        {
            Utilities.Alert.display(
                presenter: self,
                errorMsgTitle:
                Utilities.Localization.localize(key: "EMPTY_STACK_ALERT_MESSAGE"),
                errorMsgBody:
                Utilities.Localization.localize(key: "EMPTY_STACK_ALERT_MESSAGE_BODY")
            )
        }
    }
    
}
