//
//  DatePicker.swift
//  AmusementParkPassGeneratorPart2
//
//  Created by Brandon Mahoney on 11/23/18.
//  Copyright © 2018 Brandon Mahoney. All rights reserved.
//

import Foundation
import UIKit


class OptionPicker: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var textField: UITextField!
    
    var options = [String]()
    
    init(textField: UITextField, arrayOfOptions: [String]) {
        super.init(frame: CGRect.zero)
        self.textField = textField
        self.options = arrayOfOptions
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UIPickerView Delegation
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.textField.text = options[row]
        
    }
}
