//
//  LabeledTextFieldViewModel.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 26-03-24.
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

class LabeledTextFieldViewModel: BaseViewModel {

    // Observable
    private var rutTextFieldSubject = CurrentValueSubject<String?, Never>(nil)
    private var rutFirstTime = true
    private var firstNameTextFieldSubject = CurrentValueSubject<String?, Never>(nil)
    private var firstNameFirstTime = true
    private var emailTextFieldSubject = CurrentValueSubject<String?, Never>(nil)
    private var emailFirstTime = true
    private var phoneTextFieldSubject = CurrentValueSubject<String?, Never>(nil)
    private var phoneFirstTime = true
    @Published private(set) var goTo: TextFieldsCoordinator.GoToScene?

    // Properties
    var isValidRut: AnyPublisher<Mix, Never> {
        return rutTextFieldSubject            .map { $0 ?? "" }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .map { rut -> Mix in
                if self.rutFirstTime {
                    self.rutFirstTime = false
                    return Mix(
                        textFieldValidation: .unSelected,
                        iconValidation: .empty,
                        descriptionValidation: .normal(L10n.Textfield.rutEmpty))
                } else if rut.isEmpty {
                    return Mix(
                        textFieldValidation: .empty,
                        iconValidation: .empty,
                        descriptionValidation: .normal(L10n.Textfield.rutEmpty))
                } else if rut.hasValidPattern(pattern: TextPattern.rut.rawValue) {
                    let digit = RutHelper.shared.calculateCheckDigit(rut: rut)
                    if  rut.last == digit {
                        return Mix(
                            textFieldValidation: .valid,
                            iconValidation: .check,
                            descriptionValidation: .check(L10n.Textfield.rutCorrect))
                    } else {
                        return Mix(
                            textFieldValidation: .inValid,
                            iconValidation: .error,
                            descriptionValidation: .error(L10n.Textfield.rutError))
                    }
                } else {
                    return Mix(
                        textFieldValidation: .inValid,
                        iconValidation: .error,
                        descriptionValidation: .error(L10n.Textfield.rutError))
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
                        descriptionValidation: .normal(L10n.Textfield.nameEmpty))
                } else if firstName.isEmpty {
                    return Mix(
                        textFieldValidation: .empty,
                        iconValidation: .empty,
                        descriptionValidation: .normal(L10n.Textfield.nameEmpty))
                } else if firstName.count >= 15 {
                    return Mix(
                        textFieldValidation: .inValid,
                        iconValidation: .error,
                        descriptionValidation: .error(L10n.Textfield.nameLargeError))
                } else if firstName.count >= 3 {
                    return Mix(
                        textFieldValidation: .valid,
                        iconValidation: .check,
                        descriptionValidation: .check(L10n.Textfield.nameCorrect))
                }  else {
                    return Mix(
                        textFieldValidation: .inValid,
                        iconValidation: .error,
                        descriptionValidation: .error(L10n.Textfield.nameSmallError))
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
                        descriptionValidation: .check(L10n.Textfield.emailCorrect))
                } else {
                    return Mix(
                        textFieldValidation: .inValid,
                        iconValidation: .error,
                        descriptionValidation: .error(L10n.Textfield.emailError))
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
                        descriptionValidation: .check(L10n.Textfield.phoneCorrect))
                } else {
                    return Mix(
                        textFieldValidation: .inValid,
                        iconValidation: .error,
                        descriptionValidation: .error(L10n.Textfield.phoneError))
                }
            }
            .eraseToAnyPublisher()
    }
}

extension LabeledTextFieldViewModel {
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
