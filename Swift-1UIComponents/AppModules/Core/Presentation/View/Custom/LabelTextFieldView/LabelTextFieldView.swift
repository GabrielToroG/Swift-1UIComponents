//
//  LabelTextFieldView.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 25-03-24.
//

import UIKit

enum ValidationResult {
    case unSelected
    case selected
    case valid
    case validHidden
    case inValid
    case empty
}

enum IconResult {
    case empty
    case error
    case check
}

enum DescripcionResult {
    case empty
    case show
    case normal(String)
    case check(String)
    case error(String)
}


final class LabelTextFieldView: UIView {

    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.TextField.textfield1
        label.textColor = Asset.Colors.blackColor.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var horizontalFieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = Dimensions.StackView.small
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var leftTextField: UITextField = {
        let textField = UITextField()
        textField.font = Fonts.TextField.textfield1
        textField.layer.borderWidth = Dimensions.BorderWidth.minimum
        textField.layer.cornerRadius = Dimensions.BorderRadius.small
        textField.layer.borderColor = Asset.Colors.grayColor.color.cgColor
        textField.setHorizontalPaddingPoints(Dimensions.Margin.normal)
        textField.isUserInteractionEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private lazy var rightTextField: UITextField = {
        let textField = UITextField()
        textField.font = Fonts.TextField.textfield1
        textField.layer.borderWidth = Dimensions.BorderWidth.minimum
        textField.layer.cornerRadius = Dimensions.BorderRadius.small
        textField.layer.borderColor = Asset.Colors.darkGreyColor.color.cgColor
        textField.setHorizontalPaddingPoints(Dimensions.Margin.normal)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private lazy var stateButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body.body3
        label.textColor = Asset.Colors.blackColor.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    // Properties
    var textChangeHandler: ((String?) -> Void)? // Closure para detectar la escritura
    var textFieldState: ValidationResult = .unSelected

    // Config
    var item: LabelTextFieldViewArgs? {
        didSet {
            guard let item = item else { return }
            titleLabel.text = item.title
            rightTextField.placeholder = item.placeholder
            rightTextField.keyboardType = item.keyboardType
            leftTextField.isHidden = !item.isLeftView
            if let value = item.leftViewValue {
                leftTextField.text = value
            }
            if let image = item.initialRightImage {
                stateButton.setImage(UIImage(systemName: image), for: .normal)
            }
        }
    }

    /// Function that update the rightTextField when the user are writting
    func updateTextFields(validationResult: ValidationResult) {
        switch validationResult {
        case .unSelected:
            textFieldState = .unSelected
            rightTextField.layer.borderColor = UIColor.systemGray.cgColor
            leftTextField.layer.borderColor = UIColor.systemGray.cgColor
        case .selected:
            textFieldState = .selected
            rightTextField.layer.borderColor = UIColor.black.cgColor
            leftTextField.layer.borderColor = UIColor.black.cgColor
        case .valid:
            textFieldState = .valid
            rightTextField.layer.borderColor = UIColor.systemGreen.cgColor
            leftTextField.layer.borderColor = UIColor.systemGreen.cgColor
        case .validHidden:
            textFieldState = .validHidden
            rightTextField.layer.borderColor = UIColor.systemGray.cgColor
            leftTextField.layer.borderColor = UIColor.systemGray.cgColor
        case .inValid:
            textFieldState = .inValid
            rightTextField.layer.borderColor = UIColor.systemRed.cgColor
            leftTextField.layer.borderColor = UIColor.systemRed.cgColor
        case .empty:
            textFieldState = .empty
            rightTextField.layer.borderColor = UIColor.black.cgColor
            leftTextField.layer.borderColor = UIColor.black.cgColor
        }
    }

    /// Function that update the descriptionLabel when the user are writting
    func updateDescriptionLabel(_ message: DescripcionResult) {
        switch message {
        case .normal(let message):
            descriptionLabel.isHidden = false
            descriptionLabel.text = message
            descriptionLabel.textColor = .black
        case .show:
            descriptionLabel.isHidden = false
        case .empty:
            descriptionLabel.isHidden = true
        case .error(let message):
            descriptionLabel.isHidden = false
            descriptionLabel.text = message
            descriptionLabel.textColor = .systemRed
        case .check(let message):
            descriptionLabel.isHidden = false
            descriptionLabel.text = message
            descriptionLabel.textColor = .systemGreen
        }
    }

    /// Function that update the iconImage when the user are writting
    func updateIconImage(_ iconResult: IconResult) {
        switch iconResult {
        case .empty:
            stateButton.isHidden = true
        case .error:
            stateButton.isHidden = false
            stateButton.tintColor = .systemRed
            stateButton.setImage(UIImage(named: "textfield.close.icon"), for: .normal)
        case .check:
            stateButton.isHidden = false
            stateButton.tintColor = .systemGreen
            stateButton.setImage(UIImage(named: "textfield.success.icon"), for: .normal)
        }
    }


    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        awakeFromNib()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        configUI()
        configActions()
    }

    
    // MARK: - UI Functions
    func configUI() {
        configDelegates()
        configConstraints()
    }

    private func configDelegates() {
        rightTextField.delegate = self
    }

    private func configConstraints() {
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(stateButton)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(horizontalFieldStackView)
        horizontalFieldStackView.addArrangedSubview(leftTextField)
        horizontalFieldStackView.addArrangedSubview(rightTextField)

        let containerViewConstraints = [
            containerView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: .zero),
            containerView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: .zero),
            containerView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: .zero),
            containerView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: .zero),
        ]
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: Dimensions.Margin.small),
            titleLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Dimensions.Margin.small)
        ]
        let horizontalFieldStackViewConstraints = [
            horizontalFieldStackView.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: Dimensions.Margin.small),
            horizontalFieldStackView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Dimensions.Margin.small),
            horizontalFieldStackView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -Dimensions.Margin.small),
            horizontalFieldStackView.heightAnchor.constraint(
                equalToConstant: Dimensions.View.smallSize)
        ]
        let leftTextFieldConstraints = [
            leftTextField.widthAnchor.constraint(
                equalToConstant: Dimensions.Textfield.leftWidth)
        ]
        let stateButtonConstraints = [
            stateButton.centerYAnchor.constraint(
                equalTo: rightTextField.centerYAnchor),
            stateButton.trailingAnchor.constraint(
                equalTo: rightTextField.trailingAnchor,
                constant: -Dimensions.Margin.small),
            stateButton.widthAnchor.constraint(
                equalToConstant: Dimensions.Icon.smallSize),
            stateButton.heightAnchor.constraint(
                equalToConstant: Dimensions.Icon.smallSize)
        ]
        let descriptionLabelConstraints = [
            descriptionLabel.topAnchor.constraint(
                equalTo: rightTextField.bottomAnchor,
                constant: Dimensions.Margin.small),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Dimensions.Margin.small),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -Dimensions.Margin.small),
            descriptionLabel.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: -Dimensions.Margin.small),
            descriptionLabel.heightAnchor.constraint(
                equalToConstant: Dimensions.Textfield.descriptionWidth)
        ]

        NSLayoutConstraint.activate(
            containerViewConstraints +
            titleLabelConstraints +
            horizontalFieldStackViewConstraints +
            stateButtonConstraints +
            descriptionLabelConstraints +
            leftTextFieldConstraints
        )
    }


    // MARK: - Actions
    private func configActions() {
        rightTextField.addTarget(
            self,
            action: #selector(textFieldDidChange(_:)),
            for: .editingChanged)
    }

    @objc private func textFieldDidChange(_ textField: UITextField) {
        textChangeHandler?(textField.text)
    }
}

extension LabelTextFieldView: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textFieldState {
        case .validHidden:
            updateTextFields(validationResult: .valid)
            updateDescriptionLabel(.show)
            updateIconImage(.check)
        case .inValid:
            updateTextFields(validationResult: .inValid)
            updateDescriptionLabel(.show)
            updateIconImage(.error)
        default:
            updateTextFields(validationResult: .selected)
            updateDescriptionLabel(.show)
            updateIconImage(.empty)
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textFieldState {
        case .valid:
            updateTextFields(validationResult: .validHidden)
            updateDescriptionLabel(.empty)
            updateIconImage(.empty)
        case .inValid:
            updateTextFields(validationResult: .inValid)
            updateDescriptionLabel(.show)
            updateIconImage(.error)
        default:
            updateTextFields(validationResult: .unSelected)
            updateDescriptionLabel(.empty)
            updateIconImage(.empty)
        }
    }
}
