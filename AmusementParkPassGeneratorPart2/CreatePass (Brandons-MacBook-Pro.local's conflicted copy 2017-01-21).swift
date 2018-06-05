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
func checkAgeUnder5(day: Int, month: Int, year: Int) -> Bool {
    
    let dateOfBirth = NSDateComponents()
    dateOfBirth.day = day
    dateOfBirth.month = month
    dateOfBirth.year = year
    
    let calendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)
    let birthDate = calendar?.date(from: dateOfBirth as DateComponents)
    let currentDate = NSDate()
    
    var durationDateComponents = calendar?.components(NSCalendar.Unit.day, from: birthDate!, to: currentDate as Date)
    
    let numberOfDaysAlive = durationDateComponents?.day
    
    if numberOfDaysAlive! < 2190 {
        return true
    } else {
        return false
    }
}

func checkAgeIsUnder5(date: String) -> Bool {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "mm/DD/yyyy"
    let stringDate = dateFormatter.date(from: date)
    
    let calendar = Calendar.current
    let currentDate = NSDate()
    
    let year = calendar.component(.year, from: stringDate!)
    let month = calendar.component(.month, from: stringDate!)
    let day = calendar.component(.day, from: stringDate!)
    
    let dateOfBirth = NSDateComponents()
    dateOfBirth.day = day
    dateOfBirth.month = month
    dateOfBirth.year = year
    
    var durationDateComponents = calendar?.components(NSCalendar.Unit.day, from: birthDate!, to: currentDate as Date)
    
    let numberOfDaysAlive = durationDateComponents?.day
    
    if numberOfDaysAlive! < 2190 {
        return true
    } else {
        return false
    }
}


///////////////
//Create Pass//
///////////////
func createPass(entrant: Entrant) throws {
//    let viewController = ViewController()
    
    /*
    if viewController.firstName == nil || viewController.lastName == nil && entrant.entrantType.nameRequired == true{
        throw ErrorTypes.EnterFullName
    }
    */
    
    if ((entrant.firstName == "" || entrant.lastName == "") && entrant.entrantType.nameRequired == true) {
        throw ErrorTypes.EnterFullName
    }
//    if entrant.dayOfBirth < 1 || entrant.monthOfBirth < 1 || entrant.yearOfBirth < 1 && entrant.entrantType.birthDateRequired == true {
//        throw ErrorTypes.EnterBirthDate
//    }
    if entrant.dayOfBirth < 1 || entrant.monthOfBirth < 1 || entrant.yearOfBirth < 1 && entrant.entrantType.birthDateRequired == true {
        throw ErrorTypes.EnterBirthDate
    }
    if entrant.street == "" || entrant.city == "" || entrant.state == "" || entrant.zip == "" && entrant.entrantType.addressRequired == true {
        throw ErrorTypes.EnterFullAddress
    }
    if entrant.entrantType == .FreeChild && checkAgeUnder5(day: entrant.dayOfBirth, month: entrant.monthOfBirth, year: entrant.yearOfBirth) == false {
        throw ErrorTypes.ChildIsOlderThan5
    }
    
    /*
    else{
        performSegue(withIdentifier: "CreatePassSegue", sender: nil)
        viewController.clearData()
    }
 */
    
}




    

    
    
    
    





