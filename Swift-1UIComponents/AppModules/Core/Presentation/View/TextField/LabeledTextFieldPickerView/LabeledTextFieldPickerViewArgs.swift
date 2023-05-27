//
//  LabeledTextFieldPickerViewArgs.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 25-05-23.
//

import UIKit

struct LabeledTextFieldPickerViewArgs {
    let title: String
    let pickerOptions: [String]
    
    init(
        title: String,
        pickerOptions: [String]
    ) {
        self.title = title
        self.pickerOptions = pickerOptions
    }
}
