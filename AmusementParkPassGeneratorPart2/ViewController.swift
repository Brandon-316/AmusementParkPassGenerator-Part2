//
//  ViewController.swift
//  AmusementParkPassGeneratorPart2
//
//  Created by Brandon Mahoney on 11/25/16.
//  Copyright © 2016 Brandon Mahoney. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
//Top Level Pass Types//
    @IBOutlet weak var guestBtn: UIButton!
    @IBOutlet weak var employeeBtn: UIButton!
    @IBOutlet weak var managerBtn: UIButton!
    @IBOutlet weak var vendorBtn: UIButton!
    
//No Sub Types - Manager and Vendor//
    @IBOutlet weak var noSubTypeToolBar: UIView!
    
    
//Guest Sub Types//
    @IBOutlet weak var guestToolBar: UIView!
    //Buttons
    @IBOutlet weak var childGuest: UIButton!
    @IBOutlet weak var classicGuest: UIButton!
    @IBOutlet weak var seniorGuest: UIButton!
    @IBOutlet weak var vIPGuest: UIButton!
    @IBOutlet weak var seasonGuest: UIButton!
    
//Employee Sub Types//
    @IBOutlet weak var employeeToolBar: UIView!
    //Buttons
    @IBOutlet weak var foodServiceEmp: UIButton!
    @IBOutlet weak var rideServiceEmp: UIButton!
    @IBOutlet weak var maintenanceEmp: UIButton!
    @IBOutlet weak var contractEmp: UIButton!
    
    
//Text Fields//
    @IBOutlet weak var dateOfBirth: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var projectNmbr: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var companyName: UITextField!
    @IBOutlet weak var dateOfVisit: UITextField!
    @IBOutlet weak var streetAddress: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var zipCode: UITextField!
    
    
//Bottom Buttons//
    @IBOutlet weak var generatePassBtn: UIButton!
    @IBOutlet weak var populateBtn: UIButton!

//    var entrant: Entrant
    var entrantType: EntrantPassType? = nil
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initialToolBar()
        resetForm()
        entrantType = nil
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    
//Make all text fields blank//
    func resetTextFields(textField: UITextField) {
        let textFields = [dateOfBirth, phoneNumber, projectNmbr, firstName, lastName, companyName, streetAddress, city, state, zipCode]
        for textField in textFields {
            textField?.text = ""
        }
    }
    
//Reset required text fields//
    func resetForm() {
        let textFields = [dateOfBirth, phoneNumber, projectNmbr, firstName, lastName, companyName, dateOfVisit, streetAddress, city, state, zipCode]
        for textField in textFields {
//            textField?.isEnabled = true
            textField?.backgroundColor = UIColor.lightGray
        }
    }

//Enable individual text field//
    func requireTextField(textField: UITextField) {
        textField.isEnabled = true
        textField.backgroundColor = UIColor.white
    }
    
//Blank subtype toolbar at startup//
    func initialToolBar() {
        noSubTypeToolBar.isHidden = false
        employeeToolBar.isHidden = true
        guestToolBar.isHidden = true
    }
    
    func resetMainBtnColor() {
        let buttons = [guestBtn, employeeBtn, managerBtn, vendorBtn]
        for button in buttons {
            button?.setTitleColor(UIColor.lightGray, for: .normal)
        }
    }
    
    func resetSubCatBtnColor() {
        let buttons = [childGuest, classicGuest, seniorGuest, vIPGuest, seasonGuest, foodServiceEmp, rideServiceEmp, maintenanceEmp, contractEmp]
        for button in buttons {
            button?.setTitleColor(UIColor.lightGray, for: .normal)
        }
    }
    

    @IBAction func setToolBar(button: UIButton ){
        
        func setSubCatToolBar() {
            resetForm()
            resetSubCatBtnColor()
            button.setTitleColor(UIColor.white, for: .normal)
            enableTextFields()
        }
        
        switch button {
//Guest//
        case guestBtn:
            noSubTypeToolBar.isHidden = true
            employeeToolBar.isHidden = true
            guestToolBar.isHidden = false
            resetForm()
            disableTextFields()
            resetMainBtnColor()
            button.setTitleColor(UIColor.white, for: .normal)
            entrantType = nil
        case childGuest:
            setSubCatToolBar()
            requireTextField(textField: dateOfBirth)
            entrantType = .FreeChild
        case classicGuest:
            setSubCatToolBar()
            entrantType = .Classic
        case vIPGuest:
            setSubCatToolBar()
            entrantType = .VIP
        case seniorGuest:
            setSubCatToolBar()
            requireTextField(textField: firstName)
            requireTextField(textField: lastName)
            requireTextField(textField: dateOfBirth)
            entrantType = .Senior
        case seasonGuest:
            setSubCatToolBar()
            requireTextField(textField: firstName)
            requireTextField(textField: lastName)
            requireTextField(textField: streetAddress)
            requireTextField(textField: city)
            requireTextField(textField: state)
            requireTextField(textField: zipCode)
            entrantType = .SeasonPass
//Employee//
        case employeeBtn:
            noSubTypeToolBar.isHidden = true
            employeeToolBar.isHidden = false
            guestToolBar.isHidden = true
            resetForm()
            disableTextFields()
            resetMainBtnColor()
            button.setTitleColor(UIColor.white, for: .normal)
            entrantType = nil
        case foodServiceEmp, rideServiceEmp, maintenanceEmp, contractEmp:
            setSubCatToolBar()
            requireTextField(textField: firstName)
            requireTextField(textField: lastName)
            requireTextField(textField: streetAddress)
            requireTextField(textField: city)
            requireTextField(textField: state)
            requireTextField(textField: zipCode)
            if button == foodServiceEmp{
                entrantType = .HourlyFoodServices
            }
            if button == rideServiceEmp{
                entrantType = .HourlyRideServices
            }
            if button == maintenanceEmp{
                entrantType = .HourlyMaintenance
            }
            if button == contractEmp{
                entrantType = .ContractEmployee
            }
            
            
//Manager//
        case managerBtn:
            noSubTypeToolBar.isHidden = false
            employeeToolBar.isHidden = true
            guestToolBar.isHidden = true
            resetForm()
            requireTextField(textField: firstName)
            requireTextField(textField: lastName)
            requireTextField(textField: streetAddress)
            requireTextField(textField: city)
            requireTextField(textField: state)
            requireTextField(textField: zipCode)
            resetMainBtnColor()
            button.setTitleColor(UIColor.white, for: .normal)
            enableTextFields()
            entrantType = .Manager
//Vendor//
        case vendorBtn:
            noSubTypeToolBar.isHidden = false
            employeeToolBar.isHidden = true
            guestToolBar.isHidden = true
            resetForm()
            requireTextField(textField: firstName)
            requireTextField(textField: lastName)
            requireTextField(textField: companyName)
            requireTextField(textField: dateOfBirth)
            requireTextField(textField: dateOfVisit)
            resetMainBtnColor()
            button.setTitleColor(UIColor.white, for: .normal)
            enableTextFields()
            entrantType = .Vendor
        default:
            noSubTypeToolBar.isHidden = false
            employeeToolBar.isHidden = true
            guestToolBar.isHidden = true
            resetForm()
        }
    }

//Generate Pass//
    @IBAction func generatePass(_ sender: Any) {
        do{
        try checkForRequiredFields()

        }catch ErrorTypes.EnterAllRequiredFields{
            let alertController = UIAlertController(title: "Missing Required Info", message: "Please fill in all required text fields.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }catch ErrorTypes.EntrantTypeNil{
            let alertController = UIAlertController(title: "Missing Entrant Type", message: "Please Select a Entrant Type.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }catch ErrorTypes.DateFormat{
            let alertController = UIAlertController(title: "Date Is In Incorrect Format", message: "Date must be in the format 11/11/2017", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }catch ErrorTypes.FirstNameFieldLessThan2Char{
            let alertController = UIAlertController(title: "Under Minimum Characters", message: "First Name Field Requires a Minimum of 2 Characters", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }catch ErrorTypes.LastNameFieldLessThan2Char{
            let alertController = UIAlertController(title: "Under Minimum Characters", message: "Last Name Field Requires a Minimum of 2 Characters", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }catch ErrorTypes.ZipCodeLessThan5{
            let alertController = UIAlertController(title: "Under Minimum Characters", message: "Zip Code Field Requires a Minimum of 5 Characters", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }catch ErrorTypes.ProjectNumLessThan7{
            let alertController = UIAlertController(title: "Under Minimum Characters", message: "Project Number Field Requires a Minimum of 7 Characters", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }catch ErrorTypes.CompanyLessThan2Char{
            let alertController = UIAlertController(title: "Under Minimum Characters", message: "Company Name Field Requires a Minimum of 2 Characters", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }catch ErrorTypes.StreetLessThan2Char{
            let alertController = UIAlertController(title: "Under Minimum Characters", message: "Street Name Field Requires a Minimum of 2 Characters", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }catch ErrorTypes.CityLessThan2Char{
            let alertController = UIAlertController(title: "Under Minimum Characters", message: "City Name Field Requires a Minimum of 2 Characters", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }catch ErrorTypes.StateLessThan2Char{
            let alertController = UIAlertController(title: "Under Minimum Characters", message: "State Name Field Requires a Minimum of 2 Characters", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }catch ErrorTypes.LettersOnly{
            let alertController = UIAlertController(title: "Must Only Contain Letters", message: "First, Last, City and State Name Fields May Only Contain Letters", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }catch ErrorTypes.NumbersOnly{
            let alertController = UIAlertController(title: "Must Only Contain Numbers", message: "Zipcode and Project Number fields may only contain numbers", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }catch ErrorTypes.PhoneNumberFormat{
            let alertController = UIAlertController(title: "Phone Number in Incorrect Format", message: "Phone number must be in the format 123-123-1234", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }catch ErrorTypes.ChildIsOlderThan5{
            let alertController = UIAlertController(title: "Child Older Than 5", message: "Child must be 5 years old or younger", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }catch ErrorTypes.SeniorIsYoungerThan55{
            let alertController = UIAlertController(title: "Guest is Younger Than 55", message: "Senior must be 55 years or older", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }catch {
            let alertController = UIAlertController(title: "Missing Required Info", message: "Please fill in all required text fields.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }
    }

//Check For Required Fields//
    func checkForRequiredFields() throws {
        //Checking that required are all filled out//
        
        let textChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let disallowedCharacterSet = CharacterSet(charactersIn: textChars).inverted
        
        let numChars = "0123456789"
        let disallowedNonNumSet = CharacterSet(charactersIn: numChars).inverted
        
        //Checks if required fields are filled//
        let textFields = [dateOfBirth, dateOfVisit, phoneNumber, firstName, lastName, companyName, streetAddress, city, state, zipCode, projectNmbr]
        for textField in textFields {
            if textField?.backgroundColor == .white && textField?.text?.isEmpty == true {
                throw ErrorTypes.EnterAllRequiredFields
            }
        }
        
        
        switch textFields {
        //Date Of Birth//
        case _ where (dateOfBirth?.text?.isEmpty)! == false && isValidDate(date: dateOfBirth.text!) == false: throw ErrorTypes.DateFormat
            
        //Phone Number//
        case _ where (phoneNumber?.text?.isEmpty)! == false && isValidPhoneNmbr(phoneNmbr: phoneNumber.text!) == false: throw ErrorTypes.PhoneNumberFormat
        case _ where phoneNumber?.text?.isEmpty == false && (phoneNumber?.text?.count)! < 12: throw ErrorTypes.PhoneNumberLessThan12
        
        //Project Number//
        case _ where projectNmbr?.text?.isEmpty == false && (projectNmbr?.text?.count)! < 7: throw ErrorTypes.ProjectNumLessThan7
        case _ where projectNmbr?.text?.isEmpty == false && projectNmbr?.text?.rangeOfCharacter(from: disallowedNonNumSet) != nil: throw ErrorTypes.NumbersOnly
            
        //Name Fields//
        case _ where firstName?.text?.isEmpty == false && (firstName?.text?.count)! < 2: throw ErrorTypes.FirstNameFieldLessThan2Char
        case _ where firstName?.text?.isEmpty == false && firstName?.text?.rangeOfCharacter(from: disallowedCharacterSet) != nil: throw ErrorTypes.LettersOnly
        case _ where lastName?.text?.isEmpty == false && (lastName?.text?.count)! < 2: throw ErrorTypes.LastNameFieldLessThan2Char
        case _ where lastName?.text?.isEmpty == false && lastName?.text?.rangeOfCharacter(from: disallowedCharacterSet) != nil: throw ErrorTypes.LettersOnly

        
        //Company Name//
        case _ where companyName?.text?.isEmpty == false && (companyName?.text?.count)! < 2: throw ErrorTypes.CompanyLessThan2Char
            
        //Street Address//
        case _ where streetAddress?.text?.isEmpty == false && (streetAddress?.text?.count)! < 2: throw ErrorTypes.StreetLessThan2Char
        
        //City//
        case _ where city?.text?.isEmpty == false && (city?.text?.count)! < 2: throw ErrorTypes.CityLessThan2Char
        case _ where city?.text?.isEmpty == false && city?.text?.rangeOfCharacter(from: disallowedCharacterSet) != nil: throw ErrorTypes.LettersOnly
         
        //State//
        case _ where state?.text?.isEmpty == false && (state?.text?.count)! < 2: throw ErrorTypes.StateLessThan2Char
        case _ where state?.text?.isEmpty == false && state?.text?.rangeOfCharacter(from: disallowedCharacterSet) != nil: throw ErrorTypes.LettersOnly
            
        //Zip Code//
        case _ where zipCode?.text?.isEmpty == false && (zipCode?.text?.count)! < 5: throw ErrorTypes.ZipCodeLessThan5
        case _ where zipCode?.text?.isEmpty == false && zipCode?.text?.rangeOfCharacter(from: disallowedNonNumSet) != nil: throw ErrorTypes.NumbersOnly
            
        //Child Over 5 Years//
        case _ where entrantType == .FreeChild && dateOfBirth?.text?.isEmpty == false && checkAgeIsUnder5(date: dateOfBirth.text!) == false: throw ErrorTypes.ChildIsOlderThan5
            
        //Senior Over 55 Years//
        case _ where entrantType == .Senior && dateOfBirth?.text?.isEmpty == false && checkAgeIsOver55(date: dateOfBirth.text!) == false: throw ErrorTypes.SeniorIsYoungerThan55
            
        case _ where entrantType == nil: throw ErrorTypes.EntrantTypeNil
        default: clearData()
        }
    }
    
//////////////Not Being Used//////////////
//Filter Text Fields by Background Color//
    func filterTextFields() -> [UITextField]{
        let textFields = [dateOfBirth, dateOfVisit, phoneNumber, firstName, lastName, companyName, streetAddress, city, state, zipCode, projectNmbr]
        var requiredTextFields: [UITextField] = []
        
        for textField in textFields {
            if textField?.backgroundColor == .white {
                requiredTextFields.append(textField!)
            }
        }
        return requiredTextFields
    }
    
    
//Prepare for Segue Method//
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let entrant = Entrant(firstName: firstName.text!, lastName: lastName.text!, street: streetAddress.text!, city: city.text!, state: state.text!, zip: zipCode.text!, dateOfBirth: dateOfBirth.text!, monthOfBirth: 11, dayOfBirth: 24, yearOfBirth: 1981, entrantType: entrantType!)
 
 
        if segue.identifier == "CreatePassSegue" {
            let controller = segue.destination as? PassViewController

            controller?.nameText = "\(entrant.firstName) \(entrant.lastName)"
            controller?.birthDay = "\(entrant.dateOfBirth)"
            
            //Set Ride Permissions Label//
            if entrant.entrantType.canAccessAllRides == true && entrant.entrantType.canSkipRideLines == true {
                controller?.rideAccess = "Unlimited Rides - Skip Ride Lines"
            }else if entrant.entrantType.canAccessAllRides == true{
                controller?.rideAccess = "Unlimited Rides"
            }else{
                controller?.rideAccess = ""
            }
            
            
            //Set Pass Entrant Type for Testing//
            controller?.entrantType = entrantType
            
            //Set Pass Type Label//
            switch entrant.entrantType {
            case .Classic: controller?.passType = "Classic Adult Guest"
            case .FreeChild: controller?.passType = "Child Guest"
            case .VIP: controller?.passType = "VIP Guest"
            case .SeasonPass: controller?.passType = "Season Pass Guest"
            case .Senior: controller?.passType = "Senior Guest"
            case .ContractEmployee: controller?.passType = "Contract Employee"
            case .HourlyFoodServices: controller?.passType = "Hourly Employee"
            case .HourlyMaintenance: controller?.passType = "Hourly Employee"
            case .HourlyRideServices: controller?.passType = "Hourly Employee"
            case .Manager: controller?.passType = "Manager"
            case .Vendor: controller?.passType = "Vendor"
            }
            
            
            controller?.foodDiscount = "\(entrant.entrantType.foodDiscount)% Food Discount"
            controller?.merchDiscount = "\(entrant.entrantType.merchandiseDiscount)% Merch Discount"
        }
    }

//Populate Data Button Action//
    @IBAction func populateData(_ sender: Any) {
        dateOfBirth.text = "03/16/1981"
        firstName.text = "Brandon"
        lastName.text = "Mahoney"
        dateOfVisit.text = "06/06/2018"
        streetAddress.text = "1100 Congress Ave"
        city.text = "Austin"
        state.text = "Texas"
        zipCode.text = "78701"
    }
    
//Set Text Fields Back to nil//
    func clearData() {
        self.performSegue(withIdentifier: "CreatePassSegue", sender: nil)
        dateOfBirth.text = nil
        phoneNumber.text = nil
        projectNmbr.text = nil
        firstName.text = nil
        lastName.text = nil
        companyName.text = nil
        dateOfVisit.text = nil
        streetAddress.text = nil
        city.text = nil
        state.text = nil
        zipCode.text = nil
    }
    
    
//Enable Text Field User Interaction//
    func enableTextFields(){
        let textFields = [dateOfBirth, dateOfVisit, phoneNumber, firstName, lastName, companyName, streetAddress, city, state, zipCode, projectNmbr]
        for field in textFields {
            field?.isUserInteractionEnabled = true
        }
    }
//Disable Text Field User Interaction//
    func disableTextFields() {
        let textFields = [dateOfBirth, dateOfVisit, phoneNumber, firstName, lastName, companyName, streetAddress, city, state, zipCode, projectNmbr]
        for field in textFields {
            field?.isUserInteractionEnabled = false
        }
    }


}

