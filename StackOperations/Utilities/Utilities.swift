//
//  Utilities.swift
//  StackOperations
//
//  Created by sanooj on 11/5/17.
//

import Foundation
import UIKit.UIAlertController

//MARK: - Debug Log
///https://github.com/JungleCandy/LoggingPrint/blob/master/LoggingPrint.swift
/// Prints the filename, function name, line number and textual representation of `object` and a newline character into the standard output if the build setting for "Active Complilation Conditions" (SWIFT_ACTIVE_COMPILATION_CONDITIONS) defines `DEBUG`.
///
/// The current thread is a prefix on the output. <UI> for the main thread, <BG> for anything else.
///
/// Only the first parameter needs to be passed to this funtion.
///
/// The textual representation is obtained from the `object` using `String(reflecting:)` which works for _any_ type. To provide a custom format for the output make your object conform to `CustomDebugStringConvertible` and provide your format in the `debugDescription` parameter.
/// - Parameters:
///   - object: The object whose textual representation will be printed. If this is an expression, it is lazily evaluated.
///   - file: The name of the file, defaults to the current file without the ".swift" extension.
///   - function: The name of the function, defaults to the function within which the call is made.
///   - line: The line number, defaults to the line number within the file that the call is made.
@inline(__always) func loggingPrint<T>(_ object: @autoclosure () -> T, _ file: String = #file, _ function: String = #function, _ line: Int = #line ,shouldSkipForRelease:Bool = {
    #if DEBUG
        return false; #else
        return true; #endif
    }()
    )
{
    if !shouldSkipForRelease
    {
        let value = object()
        let fileURL = NSURL(string: file)?.lastPathComponent ?? "Unknown file"
        let queue = Thread.isMainThread ? "UI" : "BG"
        
        print("<\(queue)> \(fileURL) \(function)[\(line)]: " + String(reflecting: value))
    }
    
}

struct Utilities
{
    private init() {}
    
    //MARK - Validators
    struct Validators
    {
        struct DateValidator
        {
            private init() {}
            
            static func validate(formatString:String , withRegex regex:String) -> Bool
            {
                guard let validationRegEx: NSRegularExpression =
                    try? NSRegularExpression(
                        pattern: regex,
                        options: [NSRegularExpression.Options.anchorsMatchLines,.caseInsensitive]
                    ) else
                {
                    return false
                }
                
                let range: NSRange =
                    NSRange(location: 0, length: formatString.count)
                
                //find the first match
                guard let result:NSTextCheckingResult =
                    validationRegEx.firstMatch(
                        in: formatString,
                        options: NSRegularExpression.MatchingOptions.anchored,
                        range: range
                    ) else
                {
                    return false
                }
                
                loggingPrint(validationRegEx.pattern,shouldSkipForRelease: true)
                
                return (result.resultType == NSTextCheckingResult.CheckingType.regularExpression)
            }
            
            //to validate against numbers
            static func validateddMMyyyyFormat(formatString:String) -> Bool
            {
                let ddMMyyyyValidationRegExPattern:String =
                    Constants.Formats.Regexes.ddmmyyFormatValidator
                
                return self.validate(
                    formatString: formatString,
                    withRegex: ddMMyyyyValidationRegExPattern
                )
            }
            
            static func validateDDMMyyyyFormat(formatString:String) -> Bool
            {
                let ddMMyyyyValidationRegExPattern:String =
                    Constants.Formats.Regexes.DDmmyyFormatValidator
                
                return self.validate(
                    formatString: formatString,
                    withRegex: ddMMyyyyValidationRegExPattern
                )
            }
            
            static func validateDate(_ dateString:String , againstFormat dateFormatString:String) -> Bool
            {
                let dateFormat:DateFormatter =
                    DateFormatter()
                
                dateFormat.dateFormat =
                dateFormatString
                
                dateFormat.locale =
                    Locale.current
                
                guard let date:Date =
                    dateFormat.date(from: dateString) else
                {
                    return false
                }
                
                loggingPrint(date)
                
                return true
            }
            
        }
        
    }
    
    struct Formatters
    {
        private init() {}
        
        static func getDateFrom(dateString: String, dateFormat: String =  Constants.Formats.DateFormats.ddMMyyyy) -> Date?
        {
            let dateFormatter =
                DateFormatter()
            
            dateFormatter.dateFormat =
            dateFormat
            
            return dateFormatter.date(from:dateString)
        }
        
        static func getStringFrom(date: Date , dateFormat: String =  Constants.Formats.DateFormats.ddMMyyyy) -> String
        {
            let dateFormatter =
                DateFormatter()
            
            dateFormatter.dateFormat =
            dateFormat
            
            return dateFormatter.string(from: date)
        }
    }
    
    struct  Alert
    {
        private init() {}
        
        static func display(presenter:UIViewController?,
                            errorMsgTitle:String? =
            Utilities.Localization.localize(key: "UNKNOWN_ERROR_ALERT_MESSAGE"),
                            errorMsgBody:String? =
            Utilities.Localization.localize(key: "UNKNOWN_ERROR_ALERT_MESSAGE_BODY")
        )
        {
            let alertAction:UIAlertAction =
                UIAlertAction(
                    title: "Dismiss",
                    style: UIAlertActionStyle.destructive) { (action:UIAlertAction) in
                        
                        loggingPrint("Dismiss")
            }
            
            let alertController:UIAlertController =
                UIAlertController(
                    title: errorMsgTitle,
                    message: errorMsgBody,
                    preferredStyle: UIAlertControllerStyle.alert
            )
            
            
            alertController.addAction(alertAction)
            
            presenter?.present(
                alertController,
                animated: true,
                completion: {
                    
                    loggingPrint("Alert")
                    
            })
        }
    }
    
    struct Localization
    {
        private init() {}
        
        static func  localize(key:String) -> String
        {
            return NSLocalizedString(key,comment: "")
        }
    }
}




