//
//  Entrant.swift
//  AmusementParkPassGeneratorPart2
//
//  Created by Brandon Mahoney on 12/30/16.
//  Copyright © 2016 Brandon Mahoney. All rights reserved.
//

import Foundation
import UIKit

var birth = NSDateComponents()


//////////////////
//Entrant Class///
//////////////////
class Entrant: Name, Address, BirthDate {
    var firstName: String
    var lastName: String
    
    var street: String
    var city: String
    var state: String
    var zip: String
    
    var dateOfBirth: String
    
    var monthOfBirth: Int
    var dayOfBirth: Int
    var yearOfBirth: Int
    
    var entrantType: EntrantPassType
    
    
    
    init(firstName: String, lastName: String, street: String, city: String, state: String, zip: String, dateOfBirth: String, monthOfBirth: Int, dayOfBirth: Int, yearOfBirth: Int, entrantType: EntrantPassType) {
        self.firstName = firstName
        self.lastName = lastName
        self.street = street
        self.city = city
        self.state = state
        self.zip = zip
        self.dateOfBirth = dateOfBirth
        self.monthOfBirth = monthOfBirth
        self.dayOfBirth = dayOfBirth
        self.yearOfBirth = yearOfBirth
        self.entrantType = entrantType
    }
}


/////////////////
//Required Info//
/////////////////
protocol Name {
    var firstName: String { get set }
    var lastName: String {get set }
}

protocol Address {
    var street: String { get set }
    var city: String { get set }
    var state: String { get set }
    var zip: String { get set }
}

protocol BirthDate {
    var dayOfBirth: Int { get set }
    var monthOfBirth: Int { get set }
    var yearOfBirth: Int { get set }
}

protocol Company {
    var vendorCompany: String { get set }
    var visit: Date { get set }
}


////////////////////////
//Birth Date Functions//
////////////////////////
func birthDate(month: Int, day: Int, year: Int) -> Date {
    let dateOfBirth = NSDateComponents()
    dateOfBirth.day = day
    dateOfBirth.month = month
    dateOfBirth.year = year
    
    let calendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)
    return (calendar?.date(from: dateOfBirth as DateComponents))!
}


