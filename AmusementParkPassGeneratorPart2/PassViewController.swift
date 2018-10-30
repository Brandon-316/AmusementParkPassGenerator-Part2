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
    var entrantType: EntrantPassType? = nil
    
    var doubleSwipeCountdown = Timer()
    var count = 0
    
    var accessGrantedSound: SystemSoundID = 0
    var accessDeniedSound: SystemSoundID = 1
    
    var birthDay = ""
    var nameText = ""
    var passType = ""
    var rideAccess = ""
    var foodDiscount = ""
    var merchDiscount = ""
    
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
//        passNameLabel.text = entrant.firstName
        passNameLabel.text = nameText
        passTypeLabel.text = passType
        rideAccessLabel.text = rideAccess
        foodDiscountLabel.text = foodDiscount
        merchDscntLabel.text = merchDiscount

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
// MARK: Methods
    //Test Area Access//
    func accessTest(area: Bool) {
        if area == true {
            testResultsLabel.text = "Access Granted"
            testResultsView.backgroundColor = UIColor.green
            testResultsLabel2.isHidden = true
            playAccessGrantedSound()
        }else{
            testResultsLabel.text = "Access Denied"
            testResultsView.backgroundColor = UIColor.red
            testResultsLabel2.isHidden = true
            playAccessDeniedSound()
        }
    }
    
    //Test Ride Access//
    //Can Ride All Rides//
    func rideAccessTest(rideAccess: Bool) {
        if rideAccess == true && count == 0{
            startCountdown()
            testResultsLabel.text = "You May Ride All Rides"
            testResultsView.backgroundColor = UIColor.green
            playAccessGrantedSound()
        }else if rideAccess == true && count > 0{
            testResultsLabel.text = "Only one swipe per guest"
            testResultsView.backgroundColor = UIColor.red
            playAccessDeniedSound()
        }else{
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
    
    
    //Timer Methods//
        func startCountdown() {
            count = 5
            doubleSwipeCountdown = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(runCountdown), userInfo: nil, repeats: true)
        }
        
        @objc func runCountdown() {
            print(count)
            if (count > 0){
                count -= 1
            }else{
                doubleSwipeCountdown.invalidate()
                print("invalidated")
            }
        }
    
    //Check Birthday Method//
    func checkBirthday() {
        let today = NSDate()
        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .short
        dateFormatter.dateFormat = "MM/dd"
        let todayString = dateFormatter.string(from: today as Date)
        
        var offsetNmbr = 0
        
        if birthDay.count == 10 {
            offsetNmbr = 5
        }else if birthDay.count == 8 {
            offsetNmbr = 3
        }
        
        let removeLast5 = birthDay.index(birthDay.endIndex, offsetBy: -offsetNmbr)
//        let trimmedDateOfBirth = birthDay.substring(to: removeLast5)
        let trimmedDateOfBirth = String(birthDay[..<removeLast5])
        
        print("\ntrimmedDatOfBirth: \(trimmedDateOfBirth)\ntodayString: \(todayString)")
        
        
        if trimmedDateOfBirth == todayString {
            happyBirthdayLabel.isHidden = false
            happyBirthdayLabel.text = "Happy Birthday!"
        }else{
            happyBirthdayLabel.isHidden = true
        }
        
    }
    
    func handleAreaAccessPressed() {
        happyBirthdayLabel.isHidden = true
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
            case "amusementAreas": accessTest(area: (entrantType?.canAccessAmusementAreas)!)
            case "kitchenAreas": accessTest(area: (entrantType?.canAccessKitchenAreas)!)
            case "rideControlAreas": accessTest(area: (entrantType?.canAccessRideControlAreas)!)
            case "officeAreas": accessTest(area: (entrantType?.canAccessOfficeAreas)!)
            case "maintenanceAreas": accessTest(area: (entrantType?.canAccessMaintenanceAreas)!)
            case "rideAccess":
                                hideAreaAccessBtns()
                                rideAccessTest(rideAccess: (entrantType?.canAccessAllRides)!)
                                skipRideLines(skipLines: (entrantType?.canSkipRideLines)!)
                                checkBirthday()
            case "discountAccess":
                                happyBirthdayLabel.isHidden = true
                                hideAreaAccessBtns()
                                discountTest(foodAccess: (entrantType?.foodDiscount)!, merchAccess: (entrantType?.merchandiseDiscount)!)
            default: return
        }
    }

    
    //Create New Pass//
    @IBAction func createNewPass(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
