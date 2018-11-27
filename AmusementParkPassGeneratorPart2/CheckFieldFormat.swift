//
//  CheckFieldFormat.swift
//  AmusementParkPassGeneratorPart2
//
//  Created by Brandon Mahoney on 1/22/17.
//  Copyright © 2017 Brandon Mahoney. All rights reserved.
//

import Foundation


func isValidEmail(testStr:String) -> Bool {
    // print("validate calendar: \(testStr)")
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: testStr)
}

func isValidPhoneNmbr(phoneNmbr:String) -> Bool {
    if phoneNmbr.count != 12 {
        return false
    }
    
    
    let emailRegEx = "[0-9]+-[0-9]+-[0-9]{2,}"
    
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: phoneNmbr)
}

func isValidDate(date:String) -> Bool {
    let emailRegEx = "[0-9]+/[0-9]+/[0-9]{2,}"
    
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: date)
}
