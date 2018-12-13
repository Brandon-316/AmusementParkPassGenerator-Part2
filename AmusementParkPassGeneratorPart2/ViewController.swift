//
//  ViewController.swift
//  AmusementParkPassGeneratorPart2
//
//  Created by Brandon Mahoney on 11/25/16.
//  Copyright © 2016 Brandon Mahoney. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {
    
// MARK: Properties
    var entrantType: EntrantType? = nil
    
    let birthdayDatePicker = UIDatePicker()
    let visitDatePicker = UIDatePicker()
    
    var companyPicker: OptionPicker?
    var myCompanyPicker: UIPickerView = UIPickerView()
    
    var projectPicker: OptionPicker?
    var myProjectPicker: UIPickerView = UIPickerView()
    
// MARK: Outlets
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

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initialToolBar()
        resetForm()
        entrantType = nil
        
        setTextViewDelegates()
        
        setUpPickers()
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    


    
    
// MARK: UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case companyName:
            if entrantType == nil {
                entrantType = .vendor(.acme)
                if companyName.text == "" {
                    myCompanyPicker.selectRow(0, inComponent: 0, animated: true)
                    companyName.text = companyPicker!.options[myCompanyPicker.selectedRow(inComponent: 0)]
                }
            }
        case projectNmbr:
            if entrantType == nil {
                entrantType = .employee(.contract(.project1001))
                if projectNmbr.text == "" {
                    myProjectPicker.selectRow(0, inComponent: 0, animated: true)
                    projectNmbr.text = projectPicker!.options[myProjectPicker.selectedRow(inComponent: 0)]
                }
            }
        case dateOfBirth:
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd/yyyy"
            dateOfBirth.text = formatter.string(from: birthdayDatePicker.date)
        default: return
        }
    }
    
    // Used to set entrantType from UIPicker
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case companyName:
            switch myCompanyPicker.selectedRow(inComponent: 0) {
            case 0: entrantType = .vendor(.acme)
            case 1: entrantType = .vendor(.fedex)
            case 2: entrantType = .vendor(.nwElectrical)
            case 3: entrantType = .vendor(.orkin)
            case 4: entrantType = .vendor(.misc)
            default: return
            }
        case projectNmbr:
            switch myProjectPicker.selectedRow(inComponent: 0) {
            case 0: entrantType = .employee(.contract(.project1001))
            case 1: entrantType = .employee(.contract(.project1002))
            case 2: entrantType = .employee(.contract(.project1003))
            case 3: entrantType = .employee(.contract(.project2001))
            case 4: entrantType = .employee(.contract(.project2002))
            default: return
            }
        case dateOfBirth:
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd/yyyy"
            dateOfBirth.text = formatter.string(from: birthdayDatePicker.date)
        case dateOfVisit:
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd/yyyy"
            dateOfVisit.text = formatter.string(from: visitDatePicker.date)
        default: return
        }
    }
    
    //Reset required text fields//
    func setTextViewDelegates() {
        let textFields = [dateOfBirth, phoneNumber, projectNmbr, firstName, lastName, companyName, dateOfVisit, streetAddress, city, state, zipCode]
        
        for txtField in textFields {
            if let field = txtField {
                field.delegate = self
            }
        }
    }
    
    
// MARK: Methods
    func setUpPickers() {
        // Set up datePicker
        birthdayDatePicker.datePickerMode = .date
        visitDatePicker.datePickerMode = .date
        dateOfBirth.inputView = birthdayDatePicker
        dateOfVisit.inputView = visitDatePicker
        
        // Set up companyPicker
        companyPicker =  OptionPicker(textField: companyName, arrayOfOptions: ["Acme", "Fedex", "NW Electrical", "Orkin", "Other"])
        myCompanyPicker.dataSource = companyPicker
        myCompanyPicker.delegate = companyPicker
        companyName.inputView = myCompanyPicker
        
        // Set up projectPicker
        projectPicker = OptionPicker(textField: projectNmbr, arrayOfOptions: ["1001", "1002", "1003", "2001", "2002",])
        myProjectPicker.dataSource = projectPicker
        myProjectPicker.delegate = projectPicker
        projectNmbr.inputView = myProjectPicker
    }
    
    func resetForm() {
        let textFields = [dateOfBirth, phoneNumber, projectNmbr, firstName, lastName, companyName, dateOfVisit, streetAddress, city, state, zipCode]
        for textField in textFields {
            textField?.text = ""
            textField?.isEnabled = false
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
            case _ where projectNmbr?.text?.isEmpty == false && (projectNmbr?.text?.count)! < 4: throw ErrorTypes.ProjectNumLessThan4
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
            case _ where entrantType == .guest(.child) && dateOfBirth?.text?.isEmpty == false && checkAgeIsUnder5(date: dateOfBirth.text!) == false: throw ErrorTypes.ChildIsOlderThan5
            
            //Senior Over 55 Years//
            case _ where entrantType == .guest(.senior) && dateOfBirth?.text?.isEmpty == false && checkAgeIsOver55(date: dateOfBirth.text!) == false: throw ErrorTypes.SeniorIsYoungerThan55
            
            case _ where entrantType == nil: throw ErrorTypes.EntrantTypeNil
            
            default: clearData()
        }
    }
    
    
    //Prepare for Segue Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let entrantType = self.entrantType else { return }
        let entrant: Entrant?
        
        switch entrantType {
            case .guest(.child): entrant = ChildGuest(birthDate: dateOfBirth.text!, entrantType: entrantType)
            case .guest(.adult): entrant = AdultGuest(entrantType: entrantType)
            case .guest(.senior): entrant = SeniorGuest(entrantType: entrantType, birthDate: dateOfBirth.text!, firstName: firstName.text!, lastName: lastName.text!)
            case .guest(.vip): entrant = VIPGuest(entrantType: entrantType)
            case .guest(.season): entrant = SeasonPassGuest(entrantType: entrantType, firstName: firstName.text!, lastName: lastName.text!, street: streetAddress.text!, city: city.text!, state: state.text!, zip: zipCode.text!)
            
            case .employee(.hourly): entrant = Employee(entrantType: entrantType, firstName: firstName.text!, lastName: lastName.text!, street: streetAddress.text!, city: city.text!, state: state.text!, zip: zipCode.text!)
            case .employee(.contract): entrant = ContractEmployee(entrantType: entrantType, firstName: firstName.text!, lastName: lastName.text!, street: streetAddress.text!, city: city.text!, state: state.text!, zip: zipCode.text!, projectNumber: projectNmbr.text!)
            case .employee(.management): entrant = Manager(entrantType: entrantType, firstName: firstName.text!, lastName: lastName.text!, street: streetAddress.text!, city: city.text!, state: state.text!, zip: zipCode.text!)
            
            case .vendor: entrant = Vendor(entrantType: entrantType, birthDate: dateOfBirth.text!, firstName: firstName.text!, lastName: lastName.text!, companyNameable: companyName.text!, visitDate: dateOfVisit.text!)
        }
        
//        let entrant = Entrant(firstName: firstName.text!, lastName: lastName.text!, street: streetAddress.text!, city: city.text!, state: state.text!, zip: zipCode.text!, dateOfBirth: dateOfBirth.text!, entrantType: entrantType)
 
 
        if segue.identifier == "CreatePassSegue" {
            let controller = segue.destination as? PassViewController

            controller?.entrant = entrant
            
            //Set Pass Entrant Type for Testing//
            controller?.entrantType = entrantType
        }
    }


    
    //Set Text Fields Back to nil
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
    
    
    //Enable Text Field User Interaction
    func enableTextFields(){
        let textFields = [dateOfBirth, dateOfVisit, phoneNumber, firstName, lastName, companyName, streetAddress, city, state, zipCode, projectNmbr]
        for field in textFields {
            field?.isUserInteractionEnabled = true
        }
    }
    //Disable Text Field User Interaction
    func disableTextFields() {
        let textFields = [dateOfBirth, dateOfVisit, phoneNumber, firstName, lastName, companyName, streetAddress, city, state, zipCode, projectNmbr]
        for field in textFields {
            field?.isUserInteractionEnabled = false
        }
    }
    
    func setSubCatToolBar(button: UIButton) {
        resetForm()
        resetSubCatBtnColor()
        button.setTitleColor(UIColor.white, for: .normal)
        enableTextFields()
    }
    
    func setSubTypeToolBar(button: UIButton) {
        if button == guestBtn {
            noSubTypeToolBar.isHidden = true
            employeeToolBar.isHidden = true
            guestToolBar.isHidden = false
        }
        
        if button == employeeBtn {
            noSubTypeToolBar.isHidden = true
            employeeToolBar.isHidden = false
            guestToolBar.isHidden = true
        }
        
        if button == managerBtn || button == vendorBtn {
            noSubTypeToolBar.isHidden = false
            employeeToolBar.isHidden = true
            guestToolBar.isHidden = true
        }
    }
    
    
    func populate(field: UITextField, with plugData: String) {
        if field.isEnabled {
            field.text = plugData
        }
    }
    
// MARK: Actions
    @IBAction func setToolBar(button: UIButton ){
        setSubTypeToolBar(button: button)
        setSubCatToolBar(button: button)
        switch button {
        //Guest//
        case guestBtn:
            resetForm()
            disableTextFields()
            resetMainBtnColor()
            button.setTitleColor(UIColor.white, for: .normal)
            entrantType = nil
        case childGuest:
            requireTextField(textField: dateOfBirth)
            entrantType = .guest(.child)
        case classicGuest:
            entrantType = .guest(.adult)
        case vIPGuest:
            entrantType = .guest(.vip)
        case seniorGuest:
            requireTextField(textField: firstName)
            requireTextField(textField: lastName)
            requireTextField(textField: dateOfBirth)
            entrantType = .guest(.senior)
        case seasonGuest:
            requireTextField(textField: firstName)
            requireTextField(textField: lastName)
            requireTextField(textField: streetAddress)
            requireTextField(textField: city)
            requireTextField(textField: state)
            requireTextField(textField: zipCode)
            entrantType = .guest(.season)
        //Employee//
        case employeeBtn:
            resetForm()
            disableTextFields()
            resetMainBtnColor()
            button.setTitleColor(UIColor.white, for: .normal)
            entrantType = nil
        case foodServiceEmp, rideServiceEmp, maintenanceEmp, contractEmp:
            requireTextField(textField: firstName)
            requireTextField(textField: lastName)
            requireTextField(textField: streetAddress)
            requireTextField(textField: city)
            requireTextField(textField: state)
            requireTextField(textField: zipCode)
            if button == foodServiceEmp{
                entrantType = .employee(.hourly(.foodService))
            }
            if button == rideServiceEmp{
                entrantType = .employee(.hourly(.rideService))
            }
            if button == maintenanceEmp{
                entrantType = .employee(.hourly(.maintenance))
            }
            if button == contractEmp{
                requireTextField(textField: projectNmbr)
                entrantType = nil
            }
            
        //Manager//
        case managerBtn:
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
            entrantType = .employee(.management(.manager))
        //Vendor//
        case vendorBtn:
            resetForm()
            requireTextField(textField: firstName)
            requireTextField(textField: lastName)
            requireTextField(textField: companyName)
            requireTextField(textField: dateOfBirth)
            requireTextField(textField: dateOfVisit)
            requireTextField(textField: companyName)
            resetMainBtnColor()
            button.setTitleColor(UIColor.white, for: .normal)
            enableTextFields()
            entrantType = nil
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
            AlertUser().generalAlert(title: "Missing Required Info", message: "Please fill in all required text fields", vc: self)
        }catch ErrorTypes.EntrantTypeNil{
            AlertUser().generalAlert(title: "Missing Entrant Type", message: "Please Select a Entrant Type.", vc: self)
        }catch ErrorTypes.DateFormat{
            AlertUser().generalAlert(title: "Date Is In Incorrect Format", message: "Date must be in the format 11/11/2017", vc: self)
        }catch ErrorTypes.FirstNameFieldLessThan2Char{
            AlertUser().generalAlert(title: "Under Minimum Characters", message: "First Name Field Requires a Minimum of 2 Characters", vc: self)
        }catch ErrorTypes.LastNameFieldLessThan2Char{
            AlertUser().generalAlert(title: "Under Minimum Characters", message: "Last Name Field Requires a Minimum of 2 Characters", vc: self)
        }catch ErrorTypes.ZipCodeLessThan5{
            AlertUser().generalAlert(title: "Under Minimum Characters", message: "Zip Code Field Requires a Minimum of 5 Characters", vc: self)
        }catch ErrorTypes.ProjectNumLessThan4{
            AlertUser().generalAlert(title: "Under Minimum Characters", message: "Project Number Field Requires a Minimum of 5 Characters", vc: self)
        }catch ErrorTypes.CompanyLessThan2Char{
            AlertUser().generalAlert(title: "Under Minimum Characters", message: "Company Name Field Requires a Minimum of 2 Characters", vc: self)
        }catch ErrorTypes.StreetLessThan2Char{
            AlertUser().generalAlert(title: "Under Minimum Characters", message: "Street Name Field Requires a Minimum of 2 Characters", vc: self)
        }catch ErrorTypes.CityLessThan2Char{
            AlertUser().generalAlert(title: "Under Minimum Characters", message: "City Name Field Requires a Minimum of 2 Characters", vc: self)
        }catch ErrorTypes.StateLessThan2Char{
            AlertUser().generalAlert(title: "Under Minimum Characters", message: "State Name Field Requires a Minimum of 2 Characters", vc: self)
        }catch ErrorTypes.LettersOnly{
            AlertUser().generalAlert(title: "Must Only Contain Letters", message: "First, Last, City and State Name Fields May Only Contain Letters", vc: self)
        }catch ErrorTypes.NumbersOnly{
            AlertUser().generalAlert(title: "Must Only Contain Numbers", message: "Zipcode and Project Number fields may only contain numbers", vc: self)
        }catch ErrorTypes.PhoneNumberFormat{
            AlertUser().generalAlert(title: "Phone Number in Incorrect Format", message: "Phone number must be in the format 123-123-1234", vc: self)
        }catch ErrorTypes.ChildIsOlderThan5{
            AlertUser().generalAlert(title: "Child Older Than 5", message: "Child must be 5 years old or younger", vc: self)
        }catch ErrorTypes.SeniorIsYoungerThan55{
            AlertUser().generalAlert(title: "Guest is Younger Than 55", message: "Senior must be 55 years or older", vc: self)
        }catch {
            AlertUser().generalAlert(title: "Missing Required Info", message: "Please fill in all required text fields.", vc: self)
        }
    }
    //Populate Data Button Action//
    @IBAction func populateData(_ sender: Any) {
        self.populate(field: dateOfBirth, with: "03/16/1981")
        self.populate(field: firstName, with: "Brandon")
        self.populate(field: lastName, with: "Mahoney")
        self.populate(field: streetAddress, with: "1100 Congress Ave")
        self.populate(field: city, with: "Austin")
        self.populate(field: state, with: "Texas")
        self.populate(field: zipCode, with: "78701")
        
        if dateOfVisit.isEnabled {
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let dateString = dateFormatter.string(from: date)
            print(date)
            self.populate(field: dateOfVisit, with: dateString)
        }
        
        if companyName.isEnabled {
            entrantType = .vendor(.acme)
            self.companyName.text = entrantType?.companyName
        }
        
        if projectNmbr.isEnabled {
            entrantType = .employee(.contract(.project1001))
            self.projectNmbr.text = entrantType?.projectNumber
        }
    }

    @IBAction func activatePicker(_ sender: Any) {
        print("Picker activated")
        
    }
    
}

