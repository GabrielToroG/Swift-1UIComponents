//
//  LabeledTextFieldViewArgs.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 26-03-24.
//

import UIKit

struct LabelTextFieldViewArgs {
    let title: String
    let isLeftView: Bool
    let leftViewValue: String?
    let keyboardType: UIKeyboardType
    let placeholder: String?
    let initialRightImage: String?
    
    init(
        title: String,
        isLeftView: Bool = false,
        leftViewValue: String? = nil,
        keyboardType: UIKeyboardType,
        placeholder: String?,
        initialRightImage: String?
    ) {
        self.title = title
        self.isLeftView = isLeftView
        self.leftViewValue = leftViewValue
        self.keyboardType = keyboardType
        self.placeholder = placeholder
        self.initialRightImage = initialRightImage
    }
}
