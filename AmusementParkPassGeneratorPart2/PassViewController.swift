//
//  PassViewController.swift
//  AmusementParkPassGeneratorPart2
//
//  Created by Brandon Mahoney on 11/25/16.
//  Copyright © 2016 Brandon Mahoney. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

class PassViewController: UIViewController {
    
// MARK: Properties
    var entrant: Entrant? = nil
    
    var entrantType: EntrantType? = nil
    
    var doubleSwipeCountdown = Timer()
    var count = 0
    
    var accessGrantedSound: SystemSoundID = 0
    var accessDeniedSound: SystemSoundID = 1
    
    var birthDay = ""
    
    // Counts
    var amusementCount = 0
    var kitchenCount = 0
    var rideControlCount = 0
    var maintenanceCount = 0
    var officeCount = 0
    // Timers
    var amusementTimer = Timer()
    var kitchenTimer = Timer()
    var rideControlTimer = Timer()
    var maintenanceTimer = Timer()
    var officeTimer = Timer()
    
    
// MARK: Outlets
    //Generated Pass//
    @IBOutlet weak var passImage: UIImageView!
    @IBOutlet weak var passNameLabel: UILabel!
    @IBOutlet weak var passTypeLabel: UILabel!
    @IBOutlet weak var rideAccessLabel: UILabel!
    @IBOutlet weak var foodDiscountLabel: UILabel!
    @IBOutlet weak var merchDscntLabel: UILabel!
    
    //Access Testing Buttons//
    @IBOutlet weak var amusementAreasBtn: UIButton!
    @IBOutlet weak var kitchenAreasBtn: UIButton!
    @IBOutlet weak var rideControlAreasBtn: UIButton!
    @IBOutlet weak var maintenanceAreasBtn: UIButton!
    @IBOutlet weak var officeAreasBtn: UIButton!
    
    //Test Results//
    @IBOutlet weak var testResultsLabel: UILabel!
    @IBOutlet weak var testResultsLabel2: UILabel!
    @IBOutlet weak var testResultsView: UIView!
    @IBOutlet weak var happyBirthdayLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
// MARK: Methods
    //Set labels
    func setLabels() {
        guard let entrant = self.entrant else { return }
        
        if let nameableEntrant = entrant as? Nameable {
            passNameLabel.text = nameableEntrant.fullName
        }
        passTypeLabel.text = entrant.entrantType.passTypeString
        
        //Set Ride Permissions Label//
        if entrant.entrantType.canAccessAllRides == true && entrant.entrantType.canSkipRideLines == true {
            rideAccessLabel.text = "Unlimited Rides - Skip Ride Lines"
        }else if entrant.entrantType.canAccessAllRides == true{
            rideAccessLabel.text = "Unlimited Rides"
        }else{
            rideAccessLabel.text = ""
        }
        
        foodDiscountLabel.text = "\(entrant.entrantType.foodDiscount)% Food Discount"
        merchDscntLabel.text = "\(entrant.entrantType.merchandiseDiscount)% Merch Discount"
        
    }
    
    //Test Area Access//
    func accessTest(forArea area: AccessArea, canAccess: Bool, count: inout Int, timer: inout Timer) {
        
        if checkDateOfVisit() == false {
            testResultsLabel.text = "Access Denied - Please See A Manager"
            testResultsLabel2.text = "You are not authorized to visit today."
            testResultsView.backgroundColor = UIColor.red
            testResultsLabel2.isHidden = false
            playAccessDeniedSound()
            return
        }
        
        if canAccess == true && count == 0 {
            startCountdown(forArea: area, count: &count, timer: &timer)
            testResultsLabel.text = "Access Granted"
            testResultsView.backgroundColor = UIColor.green
            testResultsLabel2.isHidden = true
            playAccessGrantedSound()
        }else if canAccess == true && count > 0 {
            testResultsLabel.text = "Only one swipe per guest"
            testResultsView.backgroundColor = UIColor.red
            playAccessDeniedSound()
        }else{
            testResultsLabel.text = "Access Denied"
            testResultsView.backgroundColor = UIColor.red
            testResultsLabel2.isHidden = true
            playAccessDeniedSound()
        }
    }
    
    //Test Ride Access
    //Can Ride All Rides
    func rideAccessTest(rideAccess: Bool) {
        if rideAccess == true {
            testResultsLabel.text = "You May Ride All Rides"
            testResultsView.backgroundColor = UIColor.green
            playAccessGrantedSound()
        } else {
            testResultsLabel.text = "You May Not Ride Any Rides"
            testResultsView.backgroundColor = UIColor.red
            playAccessDeniedSound()
        }
    }
    //Can Skip Lines//
    func skipRideLines(skipLines: Bool) {
        if skipLines == true && count == 0{
            testResultsLabel2.text = "You May Skip All Ride Lines"
            testResultsLabel2.isHidden = false
        }else{
            testResultsLabel2.isHidden = true
        }
    }
    
    //Test Discount Access//
    func discountTest(foodAccess: Int, merchAccess: Int) {
        if foodAccess > 0 && merchAccess > 0{
            testResultsLabel.text = "\(foodAccess)% Food Discount"
            testResultsLabel2.text = "\(merchAccess)% Merchandise Discount"
            testResultsView.backgroundColor = UIColor.green
            testResultsLabel2.isHidden = false
            playAccessGrantedSound()
        }else{
            testResultsLabel.text = "You Are Not Approved For Any Food Discounts"
            testResultsLabel2.text = "You Are Not Approved For Any Merchandise Discounts"
            testResultsView.backgroundColor = UIColor.red
            testResultsLabel2.isHidden = false
            playAccessDeniedSound()
        }
    }
    
    //Hide Area Access Buttons//
    func hideAreaAccessBtns() {
        let buttons = [amusementAreasBtn, kitchenAreasBtn, rideControlAreasBtn, maintenanceAreasBtn, officeAreasBtn]
        for button in buttons {
            button?.isHidden = true
        }
    }
    
    //Sound Methods//
    func loadAccessGrantedSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "AccessGranted", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &accessGrantedSound)
    }
    
    func playAccessGrantedSound() {
        loadAccessGrantedSound()
        AudioServicesPlaySystemSound(accessGrantedSound)
    }
    
    func loadAccessDeniedSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "AccessDenied", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &accessDeniedSound)
    }
    
    func playAccessDeniedSound() {
        loadAccessDeniedSound()
        AudioServicesPlaySystemSound(accessDeniedSound)
    }
    
    
    
    
    //Check Birthday Method//
    func checkBirthday() {
        guard let unwrappedEntrant = self.entrant else { return }
        
        if let entrant = unwrappedEntrant as? BirthDateable {
            let today = NSDate()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd"
            let todayString = dateFormatter.string(from: today as Date)
            
            var offsetNmbr = 0
            
            if entrant.birthDate.count == 10 {
                offsetNmbr = 5
            }else if entrant.birthDate.count == 8 {
                offsetNmbr = 3
            }
            
            let removeLast5 = entrant.birthDate.index(entrant.birthDate.endIndex, offsetBy: -offsetNmbr)
            let trimmedDateOfBirth = String(entrant.birthDate[..<removeLast5])
            
            if trimmedDateOfBirth == todayString {
                happyBirthdayLabel.isHidden = false
                happyBirthdayLabel.text = "Happy Birthday!"
            }else{
                happyBirthdayLabel.isHidden = true
            }
        }
    }
    
    // If visit date is specified compare with todays date
    func checkDateOfVisit() -> Bool {
        guard let unwrappedEntrant = self.entrant else { return false }
        
        if let entrant = unwrappedEntrant as? VisitDateable {
            let today = NSDate()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let todayString = dateFormatter.string(from: today as Date)
            
            if entrant.visitDate == todayString {
                return true
            } else {
                return false
            }
        } else {
            return true
        }
    }
    
    // Hide or unhide area access buttons
    func handleAreaAccessPressed() {
        let buttons = [amusementAreasBtn, kitchenAreasBtn, rideControlAreasBtn, maintenanceAreasBtn, officeAreasBtn]
        for button in buttons {
            if button?.isHidden == true{
                button?.isHidden = false
            }else{
                button?.isHidden = true
            }
        }
    }
    
// MARK: Actions
    
    @IBAction func checkAccess(_ sender: UIButton) {
        switch sender.restorationIdentifier {
            case "areaAccess": handleAreaAccessPressed()
            case "amusementAreas":
                accessTest(forArea: .Amusement, canAccess: (entrantType?.canAccessAmusementAreas)!, count: &amusementCount, timer: &amusementTimer)
                checkBirthday()
            case "kitchenAreas":
                accessTest(forArea: .Kitchen, canAccess: (entrantType?.canAccessKitchenAreas)!, count: &kitchenCount, timer: &kitchenTimer)
                checkBirthday()
            case "rideControlAreas":
                accessTest(forArea: .RideControl, canAccess: (entrantType?.canAccessRideControlAreas)!, count: &rideControlCount, timer: &rideControlTimer)
                checkBirthday()
            case "officeAreas":
                accessTest(forArea: .Office, canAccess: (entrantType?.canAccessOfficeAreas)!, count: &officeCount, timer: &officeTimer)
                checkBirthday()
            case "maintenanceAreas":
                accessTest(forArea: .Maintenance, canAccess: (entrantType?.canAccessMaintenanceAreas)!, count: &maintenanceCount, timer: &maintenanceTimer)
                checkBirthday()
            case "rideAccess":
                                hideAreaAccessBtns()
                                rideAccessTest(rideAccess: (entrantType?.canAccessAllRides)!)
                                skipRideLines(skipLines: (entrantType?.canSkipRideLines)!)
                                checkBirthday()
            case "discountAccess":
                                hideAreaAccessBtns()
                                discountTest(foodAccess: (entrantType?.foodDiscount)!, merchAccess: (entrantType?.merchandiseDiscount)!)
                                checkBirthday()
            default: return
        }
    }

    
    //Create New Pass//
    @IBAction func createNewPass(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
