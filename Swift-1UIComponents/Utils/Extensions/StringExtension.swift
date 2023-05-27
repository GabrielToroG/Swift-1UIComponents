//
//  StringExtension.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-05-23.
//

import UIKit

extension String {
    func localized() -> String {
        return NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: .main,
            value: "",
            comment: "")
    }
    /// Transforma un tipo String a un NSMutableAttributedString
    var mutableAttribute: NSMutableAttributedString {
        NSMutableAttributedString(string: self)
    }
    
    /// Recibe un patrón regex y lo valida
    func hasValidPattern(pattern: String) -> Bool {
        let stringPred = NSPredicate(format: "SELF MATCHES %@", pattern)
        return stringPred.evaluate(with: self)
    }
    
    /// Elimina el caracter de espacio al principio y final de la cadena
    func removeSpaceAtBeginEnd() -> String {
        return self.trimmingCharacters(in: CharacterSet(charactersIn: " "))
    }
}

extension NSMutableAttributedString {
    /// Cambia el color de texto de un NSMutableAttributedString
    func set(foreground: UIColor) {
        let range: NSRange = self.mutableString.range(
            of: self.string,
            options: .caseInsensitive)
        self.addAttribute(
            .foregroundColor,
            value: foreground,
            range: range)
    }
    /// Cambia la fuente de un NSMutableAttributedString
    func set(font: UIFont) {
        let range: NSRange = self.mutableString.range(
            of: self.string,
            options: .caseInsensitive)
        self.addAttribute(
            .font,
            value: font,
            range: range)
    }
}
