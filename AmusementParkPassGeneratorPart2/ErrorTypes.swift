//
//  ErrorTypes.swift
//  AmusementParkPassGenerator
//
//  Created by Brandon Mahoney on 11/19/16.
//  Copyright © 2016 Brandon Mahoney. All rights reserved.
//

import Foundation
import UIKit

enum ErrorTypes: Error {

    //Implemented//
    case EnterAllRequiredFields
    case DateFormat
    case PhoneNumberLessThan12
    case PhoneNumberFormat
    case FirstNameFieldLessThan2Char
    case LastNameFieldLessThan2Char
    case ZipCodeLessThan5
    case ProjectNumLessThan7
    case CompanyLessThan2Char
    case StreetLessThan2Char
    case CityLessThan2Char
    case StateLessThan2Char
    case LettersOnly
    case NumbersOnly
    case ChildIsOlderThan5
    case SeniorIsYoungerThan55
    case EntrantTypeNil
}
