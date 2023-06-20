//
//  TextFieldsViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 12-05-23.
//


/// M : MODEL -> USER { let age: String)
/// V: View
/// VM: ViewModel -> pegar a una api, validar, etc etc etc

import UIKit
import Combine

class TextFieldsViewController: BaseViewController<TextFieldsViewModel> {
    private enum Constants {
        enum Base {
            enum General {
                static let text: String = "textfield.title".localized()
                static let color: UIColor = .brandColor
            }
        }
    }
    // MARK: - Properties
    
    // Fecha de nacimiento
    // Pickers
    // Normal
    // Subir archivos
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = UiConstants.SMALL_SPACE
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var rutTextField: LabeledTextFieldView = {
        let textField = LabeledTextFieldView()
        textField.item = .init(
            title: "Rut",
            keyboardType: .default,
            placeholder: "99.999.999-9",
            initialRightImage: "house")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private lazy var nameTextField: LabeledTextFieldView = {
        let textField = LabeledTextFieldView()
        textField.item = .init(
            title: "Nombre",
            keyboardType: .default,
            placeholder: nil,
            initialRightImage: nil)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private lazy var emailTextField: LabeledTextFieldView = {
        let textField = LabeledTextFieldView()
        textField.item = .init(
            title: "Email",
            keyboardType: .default,
            placeholder: nil,
            initialRightImage: nil)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private lazy var phoneTextField: LabeledTextFieldView = {
        let textField = LabeledTextFieldView()
        textField.item = .init(
            title: "Teléfono",
            isLeftView: true,
            leftViewValue: "+56",
            keyboardType: .default,
            placeholder: nil,
            initialRightImage: nil)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private lazy var genderTextField: LabeledTextFieldPickerView = {
        let textField = LabeledTextFieldPickerView()
        textField.item = .init(
            title: "Génexxxxx",
            pickerOptions: ["JAJA", "AKAKE"])
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private lazy var birthTextField: LabeledTextFieldPickerView = {
        let textField = LabeledTextFieldPickerView()
        textField.item = .init(
            title: "Génexxxxx",
            pickerOptions: ["JAJA", "AKAKE"])
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()


    // MARK: - Variables
    private var cancellables = Set<AnyCancellable>()


    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configBindings()
        configUI()
    }


    // MARK: - UI Functions
    private func configUI() {
        configScrollViewToView()
        configBasic(Constants.Base.General.text, Constants.Base.General.color)
        configActions()
        configConstraints()
    }

    private func configConstraints() {
        guard let scrollView = view.subviews.first else { return }
        guard let contentView = scrollView.subviews.first else { return }
        
        contentView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(rutTextField)
        mainStackView.addArrangedSubview(nameTextField)
        mainStackView.addArrangedSubview(emailTextField)
        mainStackView.addArrangedSubview(phoneTextField)
        mainStackView.addArrangedSubview(genderTextField)
        mainStackView.addArrangedSubview(birthTextField)

        let mainStackViewConstraints = [
            mainStackView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: UiConstants.SMALL_SPACE),
            mainStackView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: UiConstants.NORMAL_SPACE),
            mainStackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -UiConstants.NORMAL_SPACE),
            mainStackView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -UiConstants.SMALL_SPACE)
        ]
        let rutTextFieldConstraints = [
            rutTextField.leadingAnchor.constraint(
                equalTo: mainStackView.leadingAnchor),
            rutTextField.trailingAnchor.constraint(
                equalTo: mainStackView.trailingAnchor),
        ]
        let nameTextFieldConstraints = [
            nameTextField.leadingAnchor.constraint(
                equalTo: mainStackView.leadingAnchor),
            nameTextField.trailingAnchor.constraint(
                equalTo: mainStackView.trailingAnchor),
        ]
        let emailTextFieldConstraints = [
            emailTextField.leadingAnchor.constraint(
                equalTo: mainStackView.leadingAnchor),
            emailTextField.trailingAnchor.constraint(
                equalTo: mainStackView.trailingAnchor),
        ]
        let phoneTextFieldConstraints = [
            phoneTextField.leadingAnchor.constraint(
                equalTo: mainStackView.leadingAnchor),
            phoneTextField.trailingAnchor.constraint(
                equalTo: mainStackView.trailingAnchor),
        ]
        let genderTextFieldConstraints = [
            genderTextField.leadingAnchor.constraint(
                equalTo: mainStackView.leadingAnchor),
            genderTextField.trailingAnchor.constraint(
                equalTo: mainStackView.trailingAnchor)
        ]
        let birthTextFieldConstraints = [
            birthTextField.leadingAnchor.constraint(
                equalTo: mainStackView.leadingAnchor),
            birthTextField.trailingAnchor.constraint(
                equalTo: mainStackView.trailingAnchor)
        ]

        NSLayoutConstraint.activate(
            mainStackViewConstraints +
            rutTextFieldConstraints +
            nameTextFieldConstraints +
            emailTextFieldConstraints +
            phoneTextFieldConstraints +
            genderTextFieldConstraints +
            birthTextFieldConstraints
        )
    }


    // MARK: - Bindings
    private func configBindings() {
        viewModel.isValidRut
            .receive(on: DispatchQueue.main)
            .sink { [weak self] mix in
                guard let self = self else { return }
                self.rutTextField.updateTextFields(validationResult: mix.textFieldValidation)
                self.rutTextField.updateDescriptionLabel(mix.descriptionValidation)
                self.rutTextField.updateIconImage(mix.iconValidation)
            }
            .store(in: &cancellables)

        viewModel.isValidFirstName
            .receive(on: DispatchQueue.main)
            .sink { [weak self] mix in
                guard let self = self else { return }
                self.nameTextField.updateTextFields(validationResult: mix.textFieldValidation)
                self.nameTextField.updateDescriptionLabel(mix.descriptionValidation)
                self.nameTextField.updateIconImage(mix.iconValidation)
            }
            .store(in: &cancellables)

        viewModel.isValidEmail
            .receive(on: DispatchQueue.main)
            .sink { [weak self] mix in
                guard let self = self else { return }
                self.emailTextField.updateTextFields(validationResult: mix.textFieldValidation)
                self.emailTextField.updateDescriptionLabel(mix.descriptionValidation)
                self.emailTextField.updateIconImage(mix.iconValidation)
            }
            .store(in: &cancellables)

        viewModel.isValidPhone
            .receive(on: DispatchQueue.main)
            .sink { [weak self] mix in
                guard let self = self else { return }
                self.phoneTextField.updateTextFields(validationResult: mix.textFieldValidation)
                self.phoneTextField.updateDescriptionLabel(mix.descriptionValidation)
                self.phoneTextField.updateIconImage(mix.iconValidation)
            }
            .store(in: &cancellables)
    }


    // MARK: - Actions
    private func configActions() {
        rutTextField.textChangeHandler = { [weak self] text in
            guard let self = self else { return }
            self.viewModel.rutTextFieldDidChange(text)
        }
        nameTextField.textChangeHandler = { [weak self] text in
            guard let self = self else { return }
            self.viewModel.firstNameTextFieldDidChange(text)
        }
        emailTextField.textChangeHandler = { [weak self] text in
            guard let self = self else { return }
            self.viewModel.emailTextFieldDidChange(text)
        }
        phoneTextField.textChangeHandler = { [weak self] text in
            guard let self = self else { return }
            self.viewModel.phoneTextFieldDidChange(text)
        }
    }
}
