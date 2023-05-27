//
//  TextFieldsViewModel.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 12-05-23.
//

import Foundation
import Combine

struct Mix {
    let textFieldValidation: ValidationResult
    let iconValidation: IconResult
    let descriptionValidation: DescripcionResult
}

enum TextPattern: String {
    case rut = #"^\d{7,8}-[0-9kK]{1}$"#
    case email = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
}

class TextFieldsViewModel: BaseViewModel {
    // MARK: - Subjects
    // Rut
    private var rutTextFieldSubject = CurrentValueSubject<String?, Never>(nil)
    private var rutFirstTime = true
    // First Name
    private var firstNameTextFieldSubject = CurrentValueSubject<String?, Never>(nil)
    private var firstNameFirstTime = true
    // Email
    private var emailTextFieldSubject = CurrentValueSubject<String?, Never>(nil)
    private var emailFirstTime = true
    // Phone
    private var phoneTextFieldSubject = CurrentValueSubject<String?, Never>(nil)
    private var phoneFirstTime = true

    
    // MARK: - AnyPublisher
    var isValidRut: AnyPublisher<Mix, Never> {
        return rutTextFieldSubject
            .map { $0 ?? "" }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .map { rut -> Mix in
                if self.rutFirstTime {
                    self.rutFirstTime = false
                    return Mix(
                        textFieldValidation: .unSelected,
                        iconValidation: .empty,
                        descriptionValidation: .normal("Ingrese un rut sin punto ni guión"))
                } else if rut.isEmpty {
                    return Mix(
                        textFieldValidation: .empty,
                        iconValidation: .empty,
                        descriptionValidation: .normal("Ingrese un rut sin punto ni guión"))
                } else if rut.hasValidPattern(pattern: TextPattern.rut.rawValue) {
                    let digit = RutHelper.shared.calculateCheckDigit(rut: rut)
                    if  rut.last == digit {
                        return Mix(
                            textFieldValidation: .valid,
                            iconValidation: .check,
                            descriptionValidation: .check("Rut válido"))
                    } else {
                        return Mix(
                            textFieldValidation: .inValid,
                            iconValidation: .error,
                            descriptionValidation: .error("El rut ingresado no es válido"))
                    }
                } else {
                    return Mix(
                        textFieldValidation: .inValid,
                        iconValidation: .error,
                        descriptionValidation: .error("El rut ingresado no es válido"))
                }
            }
            .eraseToAnyPublisher()
    }

    var isValidFirstName: AnyPublisher<Mix, Never> {
        return firstNameTextFieldSubject
            .map { $0 ?? "" }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .map { firstName -> Mix in
                if self.firstNameFirstTime {
                    self.firstNameFirstTime = false
                    return Mix(
                        textFieldValidation: .unSelected,
                        iconValidation: .empty,
                        descriptionValidation: .normal("Ingrese un nombre con al menos 3 caracteres"))
                } else if firstName.isEmpty {
                    return Mix(
                        textFieldValidation: .empty,
                        iconValidation: .empty,
                        descriptionValidation: .normal("Ingrese un nombre con al menos 3 caracteres"))
                } else if firstName.count >= 15 {
                    return Mix(
                        textFieldValidation: .inValid,
                        iconValidation: .error,
                        descriptionValidation: .error("El nombre ingresado es demasiado largo"))
                } else if firstName.count >= 3 {
                    return Mix(
                        textFieldValidation: .valid,
                        iconValidation: .check,
                        descriptionValidation: .check("Nombre válido"))
                }  else {
                    return Mix(
                        textFieldValidation: .inValid,
                        iconValidation: .error,
                        descriptionValidation: .error("El nombre ingresado es demasiado corto"))
                }
            }
            .eraseToAnyPublisher()
    }

    var isValidEmail: AnyPublisher<Mix, Never> {
        return emailTextFieldSubject
            .map { $0 ?? "" }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .map { email -> Mix in
                if self.emailFirstTime {
                    self.emailFirstTime = false
                    return Mix(
                        textFieldValidation: .unSelected,
                        iconValidation: .empty,
                        descriptionValidation: .empty)
                } else if email.isEmpty {
                    return Mix(
                        textFieldValidation: .empty,
                        iconValidation: .empty,
                        descriptionValidation: .empty)
                } else if email.hasValidPattern(pattern: TextPattern.email.rawValue) {
                    return Mix(
                        textFieldValidation: .valid,
                        iconValidation: .check,
                        descriptionValidation: .check("Email válido"))
                } else {
                    return Mix(
                        textFieldValidation: .inValid,
                        iconValidation: .error,
                        descriptionValidation: .error("El email ingresado no es válido"))
                }
            }
            .eraseToAnyPublisher()
    }

    var isValidPhone: AnyPublisher<Mix, Never> {
        return phoneTextFieldSubject
            .map { $0 ?? "" }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .map { phone -> Mix in
                if self.phoneFirstTime {
                    self.phoneFirstTime = false
                    return Mix(
                        textFieldValidation: .unSelected,
                        iconValidation: .empty,
                        descriptionValidation: .empty)
                } else if phone.isEmpty {
                    return Mix(
                        textFieldValidation: .empty,
                        iconValidation: .empty,
                        descriptionValidation: .empty)
                } else if phone.count >= 8 {
                    return Mix(
                        textFieldValidation: .valid,
                        iconValidation: .check,
                        descriptionValidation: .check("Teléfono válido"))
                } else {
                    return Mix(
                        textFieldValidation: .inValid,
                        iconValidation: .error,
                        descriptionValidation: .error("El teléfono ingresado no es válido"))
                }
            }
            .eraseToAnyPublisher()
    }
    
    // MARK: - Actions
    func rutTextFieldDidChange(_ text: String?) {
        rutTextFieldSubject.send(text)
    }
    func firstNameTextFieldDidChange(_ text: String?) {
        firstNameTextFieldSubject.send(text)
    }
    func emailTextFieldDidChange(_ text: String?) {
        emailTextFieldSubject.send(text)
    }
    func phoneTextFieldDidChange(_ text: String?) {
        phoneTextFieldSubject.send(text)
    }
}
