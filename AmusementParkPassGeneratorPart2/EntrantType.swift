//
//  EntrantEnum.swift
//  AmusementParkPassGeneratorPart2
//
//  Created by Brandon Mahoney on 11/14/18.
//  Copyright © 2018 Brandon Mahoney. All rights reserved.
//

import Foundation

// This enum models subtypes with nested enums and contains all permissions as computed properties
enum EntrantType: Equatable {
    
    case guest(Guest)
    case employee(Employee)
    case vendor(Vendor)
    
    enum Guest {
        case child
        case adult
        case senior
        case vip
        case season
    }
    
    enum Employee {
        case contract(Contract)
        case hourly(Hourly)
        case management(Management)
        
        enum Contract {
            case project1001
            case project1002
            case project1003
            case project2001
            case project2002
        }
        
        enum Hourly {
            case foodService
            case rideService
            case maintenance
        }
        
        enum Management {
            case manager
        }
    }
    
    enum Vendor: String {
        case acme
        case fedex
        case nwElectrical
        case orkin
        case misc
    }
    
    
    var passTypeString: String {
        switch self {
            case .guest(.adult):
                return "Classic Adult Guest"
            case .guest(.vip):
                return "VIP Guest"
            case .guest(.child):
                return "Child Guest"
            case .guest(.season):
                return "Season Pass Guest"
            case .guest(.senior):
                return "Senior Guest"
            
            case .employee(.contract(.project1001)):
                return "Contract Employee - Project #1001"
            case .employee(.contract(.project1002)):
                return "Contract Employee - Project #1002"
            case .employee(.contract(.project1003)):
                return "Contract Employee - Project #1003"
            case .employee(.contract(.project2001)):
                return "Contract Employee - Project #2001"
            case .employee(.contract(.project2002)):
                return "Contract Employee - Project #2002"
            
            case .employee(.hourly(.foodService)):
                return "Employee - Food Service"
            case .employee(.hourly(.rideService)):
                return "Employee - Ride Service"
            case .employee(.hourly(.maintenance)):
                return "Employee - Maintenance"
            case .employee(.management(.manager)):
                return "Manager"
            
            case .vendor(.acme):
                return "Vendor - Acme"
            case .vendor(.fedex):
                return "Vendor - Fedex"
            case .vendor(.nwElectrical):
                return "Vendor - NW Electrical"
            case .vendor(.orkin):
                return "Vendor - Orkin"
            case .vendor(.misc):
                return "Vendor - Misc. Company"
            }
    }
    
    var companyName: String {
        switch self {
            case .vendor(.acme): return "Acme"
            case .vendor(.fedex): return "Fedex"
            case .vendor(.nwElectrical): return "NW Electrical"
            case .vendor(.orkin): return "Orkin"
            case .vendor(.misc): return "Misc. Company"
            default: return ""
        }
    }
    
    var projectNumber: String {
        switch self {
            case .employee(.contract(.project1001)): return "1001"
            case .employee(.contract(.project1002)): return "1002"
            case .employee(.contract(.project1003)): return "1003"
            case .employee(.contract(.project2001)): return "2001"
            case .employee(.contract(.project2002)): return "2002"
            default: return ""
        }
    }
    
    
    var foodDiscount: Int {
        switch self {
        case .guest(.adult):
            return 0
        case .guest(.vip):
            return 10
        case .guest(.child):
            return 0
        case .guest(.season):
            return 10
        case .guest(.senior):
            return 10
            
        case .employee(.contract(.project1001)):
            return 0
        case .employee(.contract(.project1002)):
            return 0
        case .employee(.contract(.project1003)):
            return 0
        case .employee(.contract(.project2001)):
            return 0
        case .employee(.contract(.project2002)):
            return 0

        case .employee(.hourly(.foodService)):
            return 15
        case .employee(.hourly(.rideService)):
            return 15
        case .employee(.hourly(.maintenance)):
            return 15
        case .employee(.management(.manager)):
            return 25
            
        case .vendor(.acme):
            return 0
        case .vendor(.fedex):
            return 0
        case .vendor(.nwElectrical):
            return 0
        case .vendor(.orkin):
            return 0
        case .vendor(.misc):
            return 0
        }
    }
    var merchandiseDiscount: Int {
        switch self {
        case .guest(.adult):
            return 0
        case .guest(.vip):
            return 20
        case .guest(.child):
            return 0
        case .guest(.season):
            return 20
        case .guest(.senior):
            return 10
            
        case .employee(.contract(.project1001)):
            return 0
        case .employee(.contract(.project1002)):
            return 0
        case .employee(.contract(.project1003)):
            return 0
        case .employee(.contract(.project2001)):
            return 0
        case .employee(.contract(.project2002)):
            return 0
            
        case .employee(.hourly(.foodService)):
            return 25
        case .employee(.hourly(.rideService)):
            return 25
        case .employee(.hourly(.maintenance)):
            return 25
        case .employee(.management(.manager)):
            return 25
            
        case .vendor(.acme):
            return 0
        case .vendor(.fedex):
            return 0
        case .vendor(.nwElectrical):
            return 0
        case .vendor(.orkin):
            return 0
        case .vendor(.misc):
            return 0
        }
    }
    var canAccessAllRides: Bool {
        switch self {
        case .guest(.adult):
            return true
        case .guest(.vip):
            return true
        case .guest(.child):
            return true
        case .guest(.season):
            return true
        case .guest(.senior):
            return true
            
        case .employee(.contract(.project1001)):
            return false
        case .employee(.contract(.project1002)):
            return false
        case .employee(.contract(.project1003)):
            return false
        case .employee(.contract(.project2001)):
            return false
        case .employee(.contract(.project2002)):
            return false
            
        case .employee(.hourly(.foodService)):
            return true
        case .employee(.hourly(.rideService)):
            return true
        case .employee(.hourly(.maintenance)):
            return true
        case .employee(.management):
            return true
            
        case .vendor(.acme):
            return false
        case .vendor(.fedex):
            return false
        case .vendor(.nwElectrical):
            return false
        case .vendor(.orkin):
            return false
        case .vendor(.misc):
            return false
        }
    }
    var canSkipRideLines: Bool {
        switch self {
        case .guest(.adult):
            return false
        case .guest(.vip):
            return true
        case .guest(.child):
            return false
        case .guest(.season):
            return true
        case .guest(.senior):
            return true
            
        case .employee(.contract(.project1001)):
            return false
        case .employee(.contract(.project1002)):
            return false
        case .employee(.contract(.project1003)):
            return false
        case .employee(.contract(.project2001)):
            return false
        case .employee(.contract(.project2002)):
            return false
            
        case .employee(.hourly(.foodService)):
            return false
        case .employee(.hourly(.rideService)):
            return false
        case .employee(.hourly(.maintenance)):
            return false
        case .employee(.management):
            return false
            
        case .vendor(.acme):
            return false
        case .vendor(.fedex):
            return false
        case .vendor(.nwElectrical):
            return false
        case .vendor(.orkin):
            return false
        case .vendor(.misc):
            return false
        }
    }
    var canAccessAmusementAreas: Bool {
        switch self {
        case .guest(.adult):
            return true
        case .guest(.vip):
            return true
        case .guest(.child):
            return true
        case .guest(.season):
            return true
        case .guest(.senior):
            return true
            
        case .employee(.contract(.project1001)):
            return true
        case .employee(.contract(.project1002)):
            return true
        case .employee(.contract(.project1003)):
            return true
        case .employee(.contract(.project2001)):
            return false
        case .employee(.contract(.project2002)):
            return false
            
        case .employee(.hourly(.foodService)):
            return true
        case .employee(.hourly(.rideService)):
            return true
        case .employee(.hourly(.maintenance)):
            return true
        case .employee(.management):
            return true
            
        case .vendor(.acme):
            return false
        case .vendor(.fedex):
            return false
        case .vendor(.nwElectrical):
            return true
        case .vendor(.orkin):
            return true
        case .vendor(.misc):
            return true
            
            
        }
    }
    var canAccessKitchenAreas: Bool {
        switch self {
        case .guest(.adult):
            return false
        case .guest(.vip):
            return false
        case .guest(.child):
            return false
        case .guest(.season):
            return false
        case .guest(.senior):
            return false
            
        case .employee(.contract(.project1001)):
            return false
        case .employee(.contract(.project1002)):
            return false
        case .employee(.contract(.project1003)):
            return true
        case .employee(.contract(.project2001)):
            return false
        case .employee(.contract(.project2002)):
            return true
            
        case .employee(.hourly(.foodService)):
            return true
        case .employee(.hourly(.rideService)):
            return false
        case .employee(.hourly(.maintenance)):
            return true
        case .employee(.management):
            return true
        
        case .vendor(.acme):
            return true
        case .vendor(.fedex):
            return false
        case .vendor(.nwElectrical):
            return true
        case .vendor(.orkin):
            return true
        case .vendor(.misc):
            return true
        }
    }
    var canAccessRideControlAreas: Bool {
        switch self {
        case .guest(.adult):
            return false
        case .guest(.vip):
            return false
        case .guest(.child):
            return false
        case .guest(.season):
            return false
        case .guest(.senior):
            return false
            
        case .employee(.contract(.project1001)):
            return true
        case .employee(.contract(.project1002)):
            return true
        case .employee(.contract(.project1003)):
            return true
        case .employee(.contract(.project2001)):
            return false
        case .employee(.contract(.project2002)):
            return false
            
        case .employee(.hourly(.foodService)):
            return false
        case .employee(.hourly(.rideService)):
            return true
        case .employee(.hourly(.maintenance)):
            return true
        case .employee(.management):
            return true
        
        case .vendor(.acme):
            return false
        case .vendor(.fedex):
            return false
        case .vendor(.nwElectrical):
            return true
        case .vendor(.orkin):
            return true
        case .vendor(.misc):
            return false
        }
    }
    var canAccessMaintenanceAreas: Bool {
        switch self {
        case .guest(.adult):
            return false
        case .guest(.vip):
            return false
        case .guest(.child):
            return false
        case .guest(.season):
            return false
        case .guest(.senior):
            return false
            
        case .employee(.contract(.project1001)):
            return false
        case .employee(.contract(.project1002)):
            return true
        case .employee(.contract(.project1003)):
            return true
        case .employee(.contract(.project2001)):
            return false
        case .employee(.contract(.project2002)):
            return true
            
        case .employee(.hourly(.foodService)):
            return false
        case .employee(.hourly(.rideService)):
            return false
        case .employee(.hourly(.maintenance)):
            return true
        case .employee(.management):
            return true
        
        case .vendor(.acme):
            return false
        case .vendor(.fedex):
            return true
        case .vendor(.nwElectrical):
            return true
        case .vendor(.orkin):
            return false
        case .vendor(.misc):
            return false
        }
    }
    var canAccessOfficeAreas: Bool {
        switch self {
        case .guest(.adult):
            return false
        case .guest(.vip):
            return false
        case .guest(.child):
            return false
        case .guest(.season):
            return false
        case .guest(.senior):
            return false
        
        case .employee(.contract(.project1001)):
            return false
        case .employee(.contract(.project1002)):
            return false
        case .employee(.contract(.project1003)):
            return true
        case .employee(.contract(.project2001)):
            return true
        case .employee(.contract(.project2002)):
            return false
            
        case .employee(.hourly(.foodService)):
            return false
        case .employee(.hourly(.rideService)):
            return false
        case .employee(.hourly(.maintenance)):
            return false
        case .employee(.management):
            return true
        
        case .vendor(.acme):
            return false
        case .vendor(.fedex):
            return true
        case .vendor(.nwElectrical):
            return true
        case .vendor(.orkin):
            return false
        case .vendor(.misc):
            return false
        }
    }
    var nameRequired: Bool {
        switch self {
        case .guest(.adult):
            return false
        case .guest(.vip):
            return false
        case .guest(.child):
            return false
        case .guest(.season):
            return true
        case .guest(.senior):
            return true
            
        case .employee(.contract(.project1001)):
            return true
        case .employee(.contract(.project1002)):
            return true
        case .employee(.contract(.project1003)):
            return true
        case .employee(.contract(.project2001)):
            return true
        case .employee(.contract(.project2002)):
            return true
            
        case .employee(.hourly(.foodService)):
            return true
        case .employee(.hourly(.rideService)):
            return true
        case .employee(.hourly(.maintenance)):
            return true
        case .employee(.management):
            return true
            
        case .vendor(.acme):
            return true
        case .vendor(.fedex):
            return true
        case .vendor(.nwElectrical):
            return true
        case .vendor(.orkin):
            return true
        case .vendor(.misc):
            return true
        }
    }
    var birthDateRequired: Bool {
        switch self {
        case .guest(.adult):
            return false
        case .guest(.vip):
            return false
        case .guest(.child):
            return true
        case .guest(.season):
            return false
        case .guest(.senior):
            return true
        
        case .employee(.contract(.project1001)):
            return false
        case .employee(.contract(.project1002)):
            return false
        case .employee(.contract(.project1003)):
            return false
        case .employee(.contract(.project2001)):
            return false
        case .employee(.contract(.project2002)):
            return false
            
        case .employee(.hourly(.foodService)):
            return false
        case .employee(.hourly(.rideService)):
            return false
        case .employee(.hourly(.maintenance)):
            return false
        case .employee(.management):
            return false
        
        case .vendor(.acme):
            return true
        case .vendor(.fedex):
            return true
        case .vendor(.nwElectrical):
            return true
        case .vendor(.orkin):
            return true
        case .vendor(.misc):
            return true
        }
    }
    var addressRequired: Bool {
        switch self {
        case .guest(.adult):
            return false
        case .guest(.vip):
            return false
        case .guest(.child):
            return false
        case .guest(.season):
            return true
        case .guest(.senior):
            return false
            
        case .employee(.contract(.project1001)):
            return true
        case .employee(.contract(.project1002)):
            return true
        case .employee(.contract(.project1003)):
            return true
        case .employee(.contract(.project2001)):
            return true
        case .employee(.contract(.project2002)):
            return true
            
        case .employee(.hourly(.foodService)):
            return true
        case .employee(.hourly(.rideService)):
            return true
        case .employee(.hourly(.maintenance)):
            return true
        case .employee(.management):
            return true
        
        case .vendor(.acme):
            return false
        case .vendor(.fedex):
            return false
        case .vendor(.nwElectrical):
            return false
        case .vendor(.orkin):
            return false
        case .vendor(.misc):
            return false
        }
    }
    var vendorCompany: Bool {
        switch self {
        case .guest(.adult):
            return false
        case .guest(.vip):
            return false
        case .guest(.child):
            return false
        case .guest(.season):
            return false
        case .guest(.senior):
            return false
            
        case .employee(.contract(.project1001)):
            return false
        case .employee(.contract(.project1002)):
            return false
        case .employee(.contract(.project1003)):
            return false
        case .employee(.contract(.project2001)):
            return false
        case .employee(.contract(.project2002)):
            return false
            
        case .employee(.hourly(.foodService)):
            return false
        case .employee(.hourly(.rideService)):
            return false
        case .employee(.hourly(.maintenance)):
            return false
        case .employee(.management):
            return false
        
        case .vendor(.acme):
            return true
        case .vendor(.fedex):
            return true
        case .vendor(.nwElectrical):
            return true
        case .vendor(.orkin):
            return true
        case .vendor(.misc):
            return true
        }
    }
    var dateOfVisit: Bool {
        switch self {
        case .guest(.adult):
            return false
        case .guest(.vip):
            return false
        case .guest(.child):
            return false
        case .guest(.season):
            return false
        case .guest(.senior):
            return false
        
        case .employee(.contract(.project1001)):
            return false
        case .employee(.contract(.project1002)):
            return false
        case .employee(.contract(.project1003)):
            return false
        case .employee(.contract(.project2001)):
            return false
        case .employee(.contract(.project2002)):
            return false
            
        case .employee(.hourly(.foodService)):
            return false
        case .employee(.hourly(.rideService)):
            return false
        case .employee(.hourly(.maintenance)):
            return false
        case .employee(.management):
            return false
        
        case .vendor(.acme):
            return true
        case .vendor(.fedex):
            return true
        case .vendor(.nwElectrical):
            return true
        case .vendor(.orkin):
            return true
        case .vendor(.misc):
            return true
        }
    }
    
    // Method for comparing entrant - Equatable Protocol
    static func == (lhs: EntrantType, rhs: EntrantType) -> Bool {
        switch (lhs, rhs) {

        case (.guest(let a), .guest(let b)): return a == b
            
        case (.employee(.contract(let a)), .employee(.contract(let b))): return a == b
        case (.employee(.hourly(let a)), .employee(.hourly(let b))): return a == b
        case (.employee(.management(let a)), .employee(.management(let b))): return a == b
            
        case (.vendor(let a), .vendor(let b)): return a == b

        default: return false
        }
    }
}
