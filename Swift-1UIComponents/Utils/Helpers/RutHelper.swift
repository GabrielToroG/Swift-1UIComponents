//
//  RutHelper.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 26-03-24.
//

import Foundation

final class RutHelper {
    static let shared = RutHelper()
    
    private init() {}
    
    /// Calcula el último dígito verificador, para luego contrastarlo con el ingresado en un textField
    func calculateCheckDigit(rut: String) -> Character? {
        let rutNumeros = rut.dropLast().replacingOccurrences(of: ".", with: "").replacingOccurrences(of: "-", with: "")
        let rutReverso = String(rutNumeros.reversed())
        
        var suma = 0
        var multiplicador = 2
        
        for char in rutReverso {
            if multiplicador > 7 {
                multiplicador = 2
            }
            
            if let digito = Int(String(char)) {
                suma += digito * multiplicador
                multiplicador += 1
            } else {
                return nil
            }
        }
        
        let resto = suma % 11
        let digitoVerificador: Character
        
        switch resto {
        case 1:
            digitoVerificador = "k"
        case 0:
            digitoVerificador = "0"
        default:
            digitoVerificador = Character(String(11 - resto))
        }
        
        return digitoVerificador
    }
}
