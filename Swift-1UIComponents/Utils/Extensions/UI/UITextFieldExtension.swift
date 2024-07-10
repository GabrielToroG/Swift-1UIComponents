//
//  UITextFieldExtension.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 26-03-24.
//

import UIKit

extension UITextField {
    /// Fija una padding a la izquierda dentro del Text Field, para que el texto no este tan apegado al borde
    /// - Parameters:
    ///     - amount: Cantidad del left padding
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }

    /// Fija una padding a la derecha dentro del Text Field, para que el texto no este tan apegado al borde
    /// - Parameters:
    ///     - amount: Cantidad del right padding
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }

    /// Fija una padding a la izquierda y derecha dentro del Text Field, para que el texto no este tan apegado a los bordes
    /// - Parameters:
    ///     - amount: Cantidad del right padding
    func setHorizontalPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
