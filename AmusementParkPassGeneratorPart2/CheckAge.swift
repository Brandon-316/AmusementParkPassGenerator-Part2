//
//  CreatePass.swift
//  AmusementParkPassGenerator
//
//  Created by Brandon Mahoney on 11/20/16.
//  Copyright © 2016 Brandon Mahoney. All rights reserved.
//

import Foundation
import UIKit


////////////////////
//Check if Under 5//
////////////////////
func checkAgeIsUnder5(date: String) -> Bool {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "mm/DD/yyyy"
    let stringDate = dateFormatter.date(from: date)
    
    let calendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)
    let currentDate = NSDate()
    
    let year = calendar?.component(.year, from: stringDate!)
    let month = calendar?.component(.month, from: stringDate!)
    let day = calendar?.component(.day, from: stringDate!)
    
    let dateOfBirth = NSDateComponents()
    dateOfBirth.day = day!
    dateOfBirth.month = month!
    dateOfBirth.year = year!
    
    let birthDate = calendar?.date(from: dateOfBirth as DateComponents)
    
    var durationDateComponents = calendar?.components(NSCalendar.Unit.day, from: birthDate!, to: currentDate as Date)
    
    let numberOfDaysAlive = durationDateComponents?.day
    
    if numberOfDaysAlive! < 2190 {
        return true
    } else {
        return false
    }
}


////////////////////
//Check if Over 55//
////////////////////
func checkAgeIsOver55(date: String) -> Bool {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "mm/DD/yyyy"
    let stringDate = dateFormatter.date(from: date)
    
    let calendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)
    let currentDate = NSDate()
    
    let year = calendar?.component(.year, from: stringDate!)
    let month = calendar?.component(.month, from: stringDate!)
    let day = calendar?.component(.day, from: stringDate!)
    
    let dateOfBirth = NSDateComponents()
    dateOfBirth.day = day!
    dateOfBirth.month = month!
    dateOfBirth.year = year!
    
    let birthDate = calendar?.date(from: dateOfBirth as DateComponents)
    
    var durationDateComponents = calendar?.components(NSCalendar.Unit.day, from: birthDate!, to: currentDate as Date)
    
    let numberOfDaysAlive = durationDateComponents?.day
    
    if numberOfDaysAlive! > 20075 {
        return true
    } else {
        return false
    }
}
