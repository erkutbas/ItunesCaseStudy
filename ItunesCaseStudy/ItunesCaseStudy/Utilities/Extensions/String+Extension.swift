//
//  String+Extension.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 02.02.2021.
//

import Foundation

extension String {
    
    func toLocalize() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    func readableData() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:SSSZ"
        
        let dateFromInputString = dateFormatter.date(from: self)
        
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        if dateFromInputString != nil {
            return dateFormatter.string(from: dateFromInputString!)
        }
        else {
            return "N/A"
        }
    }
}
