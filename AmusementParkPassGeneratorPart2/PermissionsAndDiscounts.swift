//
//  PermissionsAndDiscounts.swift
//  AmusementParkPassGenerator
//
//  Created by Brandon Mahoney on 11/19/16.
//  Copyright © 2016 Brandon Mahoney. All rights reserved.
//

import Foundation
import UIKit

/////////////////////////////
//Permissions and Discounts//
/////////////////////////////
enum EntrantPassType {
    case Classic
    case VIP
    case FreeChild
    case SeasonPass
    case Senior
    case HourlyFoodServices
    case HourlyRideServices
    case HourlyMaintenance
    case ContractEmployee
    case Manager
    case Vendor
    
    var foodDiscount: Int {
        switch self {
        case .Classic:
            return 0
        case .VIP:
            return 10
        case .FreeChild:
            return 0
        case .SeasonPass:
            return 10
        case .Senior:
            return 10
        case .ContractEmployee:
            return 0
        case .HourlyFoodServices:
            return 15
        case .HourlyRideServices:
            return 15
        case .HourlyMaintenance:
            return 15
        case .Manager:
            return 25
        case .Vendor:
            return 0
        }
    }
    var merchandiseDiscount: Int {
        switch self {
        case .Classic:
            return 0
        case .VIP:
            return 20
        case .FreeChild:
            return 0
        case .SeasonPass:
            return 20
        case .Senior:
            return 10
        case .ContractEmployee:
            return 0
        case .HourlyFoodServices:
            return 25
        case .HourlyRideServices:
            return 25
        case .HourlyMaintenance:
            return 25
        case .Manager:
            return 25
        case .Vendor:
            return 0
        }
    }
    var canAccessAllRides: Bool {
        switch self {
        case .Classic:
            return true
        case .VIP:
            return true
        case .FreeChild:
            return true
        case .SeasonPass:
            return true
        case .Senior:
            return true
        case .ContractEmployee:
            return false
        case .HourlyFoodServices:
            return true
        case .HourlyRideServices:
            return true
        case .HourlyMaintenance:
            return true
        case .Manager:
            return true
        case .Vendor:
            return false
        }
    }
    var canSkipRideLines: Bool {
        switch self {
        case .Classic:
            return false
        case .VIP:
            return true
        case .FreeChild:
            return false
        case .SeasonPass:
            return true
        case .Senior:
            return true
        case .ContractEmployee:
            return false
        case .HourlyFoodServices:
            return false
        case .HourlyRideServices:
            return false
        case .HourlyMaintenance:
            return false
        case .Manager:
            return false
        case .Vendor:
            return false
        }
    }
    var canAccessAmusementAreas: Bool {
        switch self {
        case .Classic:
            return true
        case .VIP:
            return true
        case .FreeChild:
            return true
        case .SeasonPass:
            return true
        case .Senior:
            return true
        case .ContractEmployee:
            return true
        case .HourlyFoodServices:
            return true
        case .HourlyRideServices:
            return true
        case .HourlyMaintenance:
            return true
        case .Manager:
            return true
        case .Vendor:
            return true
        }
    }
    var canAccessKitchenAreas: Bool {
        switch self {
        case .Classic:
            return false
        case .VIP:
            return false
        case .FreeChild:
            return false
        case .SeasonPass:
            return false
        case .Senior:
            return false
        case .ContractEmployee:
            return true
        case .HourlyFoodServices:
            return true
        case .HourlyRideServices:
            return false
        case .HourlyMaintenance:
            return true
        case .Manager:
            return true
        case .Vendor:
            return true
        }
    }
    var canAccessRideControlAreas: Bool {
        switch self {
        case .Classic:
            return false
        case .VIP:
            return false
        case .FreeChild:
            return false
        case .SeasonPass:
            return false
        case .Senior:
            return false
        case .ContractEmployee:
            return false
        case .HourlyFoodServices:
            return false
        case .HourlyRideServices:
            return true
        case .HourlyMaintenance:
            return true
        case .Manager:
            return true
        case .Vendor:
            return false
        }
    }
    var canAccessMaintenanceAreas: Bool {
        switch self {
        case .Classic:
            return false
        case .VIP:
            return false
        case .FreeChild:
            return false
        case .SeasonPass:
            return false
        case .Senior:
            return false
        case .ContractEmployee:
            return false
        case .HourlyFoodServices:
            return false
        case .HourlyRideServices:
            return false
        case .HourlyMaintenance:
            return true
        case .Manager:
            return true
        case .Vendor:
            return false
        }
    }
    var canAccessOfficeAreas: Bool {
        switch self {
        case .Classic:
            return false
        case .VIP:
            return false
        case .FreeChild:
            return false
        case .SeasonPass:
            return false
        case .Senior:
            return false
        case .ContractEmployee:
            return false
        case .HourlyFoodServices:
            return false
        case .HourlyRideServices:
            return false
        case .HourlyMaintenance:
            return false
        case .Manager:
            return true
        case .Vendor:
            return false
        }
    }
    var nameRequired: Bool {
        switch self {
        case .Classic:
            return false
        case .VIP:
            return false
        case .FreeChild:
            return false
        case .SeasonPass:
            return true
        case .Senior:
            return true
        case .ContractEmployee:
            return true
        case .HourlyFoodServices:
            return true
        case .HourlyRideServices:
            return true
        case .HourlyMaintenance:
            return true
        case .Manager:
            return true
        case .Vendor:
            return true
        }
    }
    var birthDateRequired: Bool {
        switch self {
        case .Classic:
            return false
        case .VIP:
            return false
        case .FreeChild:
            return true
        case .SeasonPass:
            return false
        case .Senior:
            return true
        case .ContractEmployee:
            return false
        case .HourlyFoodServices:
            return false
        case .HourlyRideServices:
            return false
        case .HourlyMaintenance:
            return false
        case .Manager:
            return false
        case .Vendor:
            return true
        }
    }
    var addressRequired: Bool {
        switch self {
        case .Classic:
            return false
        case .VIP:
            return false
        case .FreeChild:
            return false
        case .SeasonPass:
            return true
        case .Senior:
            return false
        case .ContractEmployee:
            return true
        case .HourlyFoodServices:
            return true
        case .HourlyRideServices:
            return true
        case .HourlyMaintenance:
            return true
        case .Manager:
            return true
        case .Vendor:
            return false
        }
    }
    var vendorCompany: Bool {
        switch self {
        case .Classic:
            return false
        case .VIP:
            return false
        case .FreeChild:
            return false
        case .SeasonPass:
            return false
        case .Senior:
            return false
        case .ContractEmployee:
            return false
        case .HourlyFoodServices:
            return false
        case .HourlyRideServices:
            return false
        case .HourlyMaintenance:
            return false
        case .Manager:
            return false
        case .Vendor:
            return true
        }
    }
    var dateOfVisit: Bool {
        switch self {
        case .Classic:
            return false
        case .VIP:
            return false
        case .FreeChild:
            return false
        case .SeasonPass:
            return false
        case .Senior:
            return false
        case .ContractEmployee:
            return false
        case .HourlyFoodServices:
            return false
        case .HourlyRideServices:
            return false
        case .HourlyMaintenance:
            return false
        case .Manager:
            return false
        case .Vendor:
            return true
        }
    }
}
