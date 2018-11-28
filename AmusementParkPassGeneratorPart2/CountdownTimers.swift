//
//  CountdownTimers.swift
//  AmusementParkPassGeneratorPart2
//
//  Created by Brandon Mahoney on 11/25/18.
//  Copyright © 2018 Brandon Mahoney. All rights reserved.
//

import Foundation
import UIKit


extension PassViewController {
    //Timer Methods//
    func startCountdown(forArea area: AccessArea, count: inout Int, timer: inout Timer) {
        count = 5
        switch area {
            case .Amusement: timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(runAmusementCountdown), userInfo: nil, repeats: true)
            case .Kitchen: timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(runKitchenCountdown), userInfo: nil, repeats: true)
            case .RideControl: timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(runRideControlCountdown), userInfo: nil, repeats: true)
            case .Maintenance: timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(runMaintenanceCountdown), userInfo: nil, repeats: true)
            case .Office: timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(runOfficeCountdown), userInfo: nil, repeats: true)
        }
    }
    
    
    @objc func runAmusementCountdown() {
        if (amusementCount > 0){
            amusementCount -= 1
        }else{
            amusementTimer.invalidate()
        }
    }
    @objc func runKitchenCountdown() {
        if (kitchenCount > 0){
            kitchenCount -= 1
        }else{
            kitchenTimer.invalidate()
        }
    }
    @objc func runRideControlCountdown() {
        if (rideControlCount > 0){
            rideControlCount -= 1
        }else{
            rideControlTimer.invalidate()
        }
    }
    @objc func runMaintenanceCountdown() {
        if (maintenanceCount > 0){
            maintenanceCount -= 1
        }else{
            maintenanceTimer.invalidate()
        }
    }
    @objc func runOfficeCountdown() {
        if (officeCount > 0){
            officeCount -= 1
        }else{
            officeTimer.invalidate()
        }
    }
    
    
}
