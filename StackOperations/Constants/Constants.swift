//
//  Constants.swift
//  StackOperations
//
//  Created by sanooj on 11/5/17.
//

import Foundation

struct Constants
{
    private init() {}
    
    struct Identifiers
    {
        private init() {}
        
        struct TableCellIdentifiers
        {
            private init() {}
            
            static let dateDisplayTableViewCellID: String =
            "dateDisplayTableViewCellID"
        }
        
        struct StoryboardIdentifiers
        {
            private init() {}
            
            static let dateDisplayTableViewControllerID: String =
            "dateDisplayTableViewControllerID"
            
            static let dateDisplayViewControllerID: String =
            "dateDisplayViewControllerID"
        }
    }
    
    
    struct Formats
    {
        private init() {}
        
        struct DateFormats
        {
            private init() {}
            
            //DD - days in a year
            //MM - month in year
            //yy - year
            static let DDMMYYYY =
            "DD/MM/YYYY"
            
            static let ddMMyyyy =
            "dd/MM/yyyy"
        }
        
        struct Regexes
        {
            private init() {}
            
            static let ddmmyyFormatValidator =
            "([0-9]{2}/[0-9]{2}/[0-9]{4})"
            
            static let DDmmyyFormatValidator =
            "([0-9]{3}/[0-9]{2}/[0-9]{4})"
        }
    }

}

