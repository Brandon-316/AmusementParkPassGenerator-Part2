//
//  Protocols.swift
//  AmusementParkPassGeneratorPart2
//
//  Created by Brandon Mahoney on 11/28/18.
//  Copyright © 2018 Brandon Mahoney. All rights reserved.
//

import Foundation

protocol Enterable {
    var entrantType: EntrantType { get set }
}

protocol BirthDateable {
    var birthDate: String { get set }
}

protocol Nameable {
    var firstName: String { get set }
    var lastName: String { get set }
    var fullName: String { get }
}

protocol Addressable {
    var street: String { get set }
    var city: String { get set }
    var state: String { get set }
    var zip: String { get set }
}

protocol ProjectNumberable {
    var projectNumber: String { get set }
}

protocol CompanyNameable {
    var companyNameable: String { get set }
}

protocol VisitDateable {
    var visitDate: String { get set }
}
