//
//  Entrants.swift
//  AmusementParkPassGeneratorPart2
//
//  Created by Brandon Mahoney on 11/28/18.
//  Copyright © 2018 Brandon Mahoney. All rights reserved.
//

import Foundation

class Entrant: Enterable {
    var entrantType: EntrantType
    
    init(entrantType: EntrantType) {
        self.entrantType = entrantType
    }
}


class ChildGuest: Entrant, BirthDateable {
    var birthDate: String
    
    init(birthDate: String, entrantType: EntrantType) {
        self.birthDate = birthDate
        super.init(entrantType: entrantType)
        
    }
}

class AdultGuest: Entrant {
    override init(entrantType: EntrantType) {
        super.init(entrantType: entrantType)
    }
}

class SeniorGuest: Entrant, BirthDateable, Nameable {
    var birthDate: String
    var firstName: String
    var lastName: String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    init(entrantType: EntrantType, birthDate: String, firstName: String, lastName: String) {
        self.birthDate = birthDate
        self.firstName = firstName
        self.lastName = lastName
        
        super.init(entrantType: entrantType)
    }
}

class VIPGuest: Entrant {
    override init(entrantType: EntrantType) {
        super.init(entrantType: entrantType)
    }
}

class SeasonPassGuest: Entrant, Nameable, Addressable {
    var firstName: String
    var lastName: String
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    var street: String
    var city: String
    var state: String
    var zip: String
    
    init(entrantType: EntrantType, firstName: String, lastName: String, street: String, city: String, state: String, zip: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.street = street
        self.city = city
        self.state = state
        self.zip = zip
        
        super.init(entrantType: entrantType)
    }
}

class Employee: Entrant, Nameable, Addressable {
    var firstName: String
    var lastName: String
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    var street: String
    var city: String
    var state: String
    var zip: String
    
    init(entrantType: EntrantType, firstName: String, lastName: String, street: String, city: String, state: String, zip: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.street = street
        self.city = city
        self.state = state
        self.zip = zip
        
        super.init(entrantType: entrantType)
    }
}

class ContractEmployee: Employee, ProjectNumberable {
    var projectNumber: String
    
    init(entrantType: EntrantType, firstName: String, lastName: String, street: String, city: String, state: String, zip: String, projectNumber: String) {
        self.projectNumber = projectNumber
        
        super.init(entrantType: entrantType, firstName: firstName, lastName: lastName, street: street, city: city, state: state, zip: zip)
    }
}

class Manager: Employee {
    override init(entrantType: EntrantType, firstName: String, lastName: String, street: String, city: String, state: String, zip: String) {
        super.init(entrantType: entrantType, firstName: firstName, lastName: lastName, street: street, city: city, state: state, zip: zip)
    }
}

class Vendor: Entrant, BirthDateable, Nameable, CompanyNameable, VisitDateable {
    var birthDate: String
    
    var firstName: String
    var lastName: String
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    var companyNameable: String
    var visitDate: String
    
    init(entrantType: EntrantType, birthDate: String, firstName: String, lastName: String, companyNameable: String, visitDate: String) {
        self.birthDate = birthDate
        self.firstName = firstName
        self.lastName = lastName
        self.companyNameable = companyNameable
        self.visitDate = visitDate
        super.init(entrantType: entrantType)
    }
}
