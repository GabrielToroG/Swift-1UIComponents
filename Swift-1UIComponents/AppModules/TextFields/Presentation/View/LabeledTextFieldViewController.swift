//
//  LabeledTextFieldViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 26-03-24.
//

import UIKit

final class LabeledTextFieldViewController: BaseViewController<LabeledTextFieldViewModel, TextFieldsCoordinator> {

    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = Dimensions.StackView.tinySpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var rutTextField: LabelTextFieldView = {
        let textField = LabelTextFieldView()
        textField.item = .init(
            title: "Rut",
            keyboardType: .default,
            placeholder: "99.999.999-9",
            initialRightImage: "house")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private lazy var nameTextField: LabelTextFieldView = {
        let textField = LabelTextFieldView()
        textField.item = .init(
            title: "Nombre",
            keyboardType: .default,
            placeholder: nil,
            initialRightImage: nil)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private lazy var emailTextField: LabelTextFieldView = {
        let textField = LabelTextFieldView()
        textField.item = .init(
            title: "Email",
            keyboardType: .default,
            placeholder: nil,
            initialRightImage: nil)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private lazy var phoneTextField: LabelTextFieldView = {
        let textField = LabelTextFieldView()
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
}

extension LabeledTextFieldViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configBindings()
    }
}

extension LabeledTextFieldViewController {
    private func configBindings() {
        viewModel.isValidRut
            .receive(on: DispatchQueue.main)
            .sink { [weak self] mix in
                guard let self = self else { return }
                self.rutTextField.updateTextFields(validationResult: mix.textFieldValidation)
                self.rutTextField.updateDescriptionLabel(mix.descriptionValidation)
                self.rutTextField.updateIconImage(mix.iconValidation)
            }
            .store(in: &anyCancellable)
        
        viewModel.isValidFirstName
            .receive(on: DispatchQueue.main)
            .sink { [weak self] mix in
                guard let self = self else { return }
                self.nameTextField.updateTextFields(validationResult: mix.textFieldValidation)
                self.nameTextField.updateDescriptionLabel(mix.descriptionValidation)
                self.nameTextField.updateIconImage(mix.iconValidation)
            }
            .store(in: &anyCancellable)
        
        viewModel.isValidEmail
            .receive(on: DispatchQueue.main)
            .sink { [weak self] mix in
                guard let self = self else { return }
                self.emailTextField.updateTextFields(validationResult: mix.textFieldValidation)
                self.emailTextField.updateDescriptionLabel(mix.descriptionValidation)
                self.emailTextField.updateIconImage(mix.iconValidation)
            }
            .store(in: &anyCancellable)
        
        viewModel.isValidPhone
            .receive(on: DispatchQueue.main)
            .sink { [weak self] mix in
                guard let self = self else { return }
                self.phoneTextField.updateTextFields(validationResult: mix.textFieldValidation)
                self.phoneTextField.updateDescriptionLabel(mix.descriptionValidation)
                self.phoneTextField.updateIconImage(mix.iconValidation)
            }
            .store(in: &anyCancellable)
    }
}

extension LabeledTextFieldViewController {
    private func configUI() {
        configScrollViewToView()
        configBasic(L10n.Textfield.title, Asset.Colors.whiteColor.color)
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

        let mainStackViewConstraints = [
            mainStackView.topAnchor.constraint(
                equalTo: contentView.safeAreaLayoutGuide.topAnchor,
                constant: Dimensions.Margin.small),
            mainStackView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Dimensions.Margin.normal),
            mainStackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Dimensions.Margin.normal),
            mainStackView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -Dimensions.Margin.small)
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

        NSLayoutConstraint.activate(
            mainStackViewConstraints +
            rutTextFieldConstraints +
            nameTextFieldConstraints +
            emailTextFieldConstraints +
            phoneTextFieldConstraints
        )
    }
}

extension LabeledTextFieldViewController {
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
