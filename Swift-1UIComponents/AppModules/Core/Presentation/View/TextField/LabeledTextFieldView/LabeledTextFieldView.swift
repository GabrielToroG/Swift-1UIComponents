//
//  LabeledTextFieldView.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 12-05-23.
//

import UIKit

enum ValidationResult {
    case unSelected
    case selected
    case valid
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


class LabeledTextFieldView: UIView {
    private enum Constants {
        enum Label {
            enum Title {
                static let textColor: UIColor = .blackColor
                static let font: UIFont = .montserratRegular16
            }
            enum Description {
                static let textColor: UIColor = .blackColor
                static let font: UIFont = .montserratRegular12
            }
        }
        enum TextField {
            enum Left {
                static let font: UIFont = .montserratRegular16
                static let borderWidth: CGFloat = 1
                static let borderColor: CGColor = UIColor.systemGray.cgColor
                static let radius: CGFloat = 4
            }
            enum Right {
                static let font: UIFont = .montserratRegular16
                static let borderWidth: CGFloat = 1
                static let borderColor: CGColor = UIColor.systemGray.cgColor
                static let radius: CGFloat = 4
            }
        }
    }

    // MARK: - Outlets
    private lazy var containerHeader: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = true
        return view
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Label.Title.font
        label.textColor = Constants.Label.Title.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var horizontalFieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = UiConstants.smallSpace
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var leftTextField: UITextField = {
        let textField = UITextField()
        textField.font = Constants.TextField.Left.font
        textField.layer.borderWidth = Constants.TextField.Left.borderWidth
        textField.layer.cornerRadius = Constants.TextField.Left.radius
        textField.layer.borderColor = Constants.TextField.Left.borderColor
        textField.setLeftPaddingPoints(UiConstants.normalSpace)
        textField.setRightPaddingPoints(UiConstants.normalSpace)
        textField.isUserInteractionEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private lazy var rightTextField: UITextField = {
        let textField = UITextField()
        textField.font = Constants.TextField.Right.font
        textField.layer.borderWidth = Constants.TextField.Right.borderWidth
        textField.layer.cornerRadius = Constants.TextField.Right.radius
        textField.layer.borderColor = Constants.TextField.Right.borderColor
        textField.setLeftPaddingPoints(UiConstants.normalSpace)
        textField.setRightPaddingPoints(UiConstants.superXLSpace)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private lazy var errorButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Label.Description.font
        label.textColor = Constants.Label.Description.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    // MARK: - Properties
    var textChangeHandler: ((String?) -> Void)? // Closure para detectar la escritura
    var textFieldState: ValidationResult = .unSelected


    // MARK: - Config
    /// Item for initial state
    var item: LabeledTextFieldViewArgs? {
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
                errorButton.setImage(UIImage(systemName: image), for: .normal)
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
            errorButton.isHidden = true
        case .error:
            errorButton.isHidden = false
            errorButton.tintColor = .systemRed
            errorButton.setImage(UIImage(named: "textfield.close.icon"), for: .normal)
        case .check:
            errorButton.isHidden = false
            errorButton.tintColor = .systemGreen
            errorButton.setImage(UIImage(named: "textfield.success.icon"), for: .normal)
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
        setupUI()
        configActions()
    }

    
    // MARK: - UI Functions
    func setupUI() {
        configDelegates()
        configConstraints()
    }

    private func configDelegates() {
        rightTextField.delegate = self
    }

    private func configConstraints() {
        addSubview(containerHeader)
        containerHeader.addSubview(titleLabel)
        containerHeader.addSubview(errorButton)
        containerHeader.addSubview(descriptionLabel)
        containerHeader.addSubview(horizontalFieldStackView)
        horizontalFieldStackView.addArrangedSubview(leftTextField)
        horizontalFieldStackView.addArrangedSubview(rightTextField)

        let containerHeaderConstraints = [
            containerHeader.topAnchor.constraint(
                equalTo: topAnchor),
            containerHeader.leadingAnchor.constraint(
                equalTo: leadingAnchor),
            containerHeader.trailingAnchor.constraint(
                equalTo: trailingAnchor),
            containerHeader.bottomAnchor.constraint(
                equalTo: bottomAnchor)
        ]
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(
                equalTo: containerHeader.topAnchor,
                constant: UiConstants.smallSpace),
            titleLabel.leadingAnchor.constraint(
                equalTo: containerHeader.leadingAnchor,
                constant: UiConstants.smallSpace)
        ]
        let horizontalFieldStackViewConstraints = [
            horizontalFieldStackView.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: UiConstants.smallSpace),
            horizontalFieldStackView.leadingAnchor.constraint(
                equalTo: containerHeader.leadingAnchor,
                constant: UiConstants.smallSpace),
            horizontalFieldStackView.trailingAnchor.constraint(
                equalTo: containerHeader.trailingAnchor,
                constant: -UiConstants.smallSpace),
            horizontalFieldStackView.heightAnchor.constraint(
                equalToConstant: UiConstants.superSpace)
        ]
        let leftTextFieldConstraints = [
            leftTextField.widthAnchor.constraint(
                equalToConstant: UiConstants.extremeXLSpace)
        ]
        let errorButtonConstraints = [
            errorButton.centerYAnchor.constraint(
                equalTo: rightTextField.centerYAnchor),
            errorButton.trailingAnchor.constraint(
                equalTo: rightTextField.trailingAnchor,
                constant: -UiConstants.smallSpace),
            errorButton.widthAnchor.constraint(
                equalToConstant: UiConstants.bigXLSpace),
            errorButton.heightAnchor.constraint(
                equalToConstant: UiConstants.bigXLSpace)
        ]
        let descriptionLabelConstraints = [
            descriptionLabel.topAnchor.constraint(
                equalTo: rightTextField.bottomAnchor,
                constant: UiConstants.smallSpace),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: containerHeader.leadingAnchor,
                constant: UiConstants.smallSpace),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: containerHeader.trailingAnchor,
                constant: -UiConstants.smallSpace),
            descriptionLabel.bottomAnchor.constraint(
                equalTo: containerHeader.bottomAnchor,
                constant: -UiConstants.smallSpace),
            descriptionLabel.heightAnchor.constraint(
                equalToConstant: UiConstants.normalSpace)
        ]

        NSLayoutConstraint.activate(
            containerHeaderConstraints +
            titleLabelConstraints +
            horizontalFieldStackViewConstraints +
            errorButtonConstraints +
            descriptionLabelConstraints +
            leftTextFieldConstraints
        )
    }


    // MARK: - Actions
    private func configActions() {
        rightTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    @objc private func textFieldDidChange(_ textField: UITextField) {
        textChangeHandler?(textField.text)
    }
}

extension LabeledTextFieldView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        updateTextFields(validationResult: .selected)
        updateDescriptionLabel(.show)
        updateIconImage(.empty)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateTextFields(validationResult: .unSelected)
        updateDescriptionLabel(.empty)
        updateIconImage(.empty)
    }
}
