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
        enum View {
            enum Container {
                static let color: UIColor = .clear
                static let topAnchor: CGFloat = UiConstants.NO_SPACE
                static let leadingAnchor: CGFloat = UiConstants.NO_SPACE
                static let trailingAnchor: CGFloat = UiConstants.NO_SPACE
                static let bottomAnchor: CGFloat = UiConstants.NO_SPACE
            }
        }
        enum StackView {
            enum Horizontal {
                static let spacing: CGFloat = 8
                static let topAnchor: CGFloat = UiConstants.SMALL_SPACE
                static let leadingAnchor: CGFloat = UiConstants.SMALL_SPACE
                static let trailingAnchor: CGFloat = -UiConstants.SMALL_SPACE
                static let heightAnchor: CGFloat = UiConstants.SMALL_STACKVIEW_HEIGHT
            }
        }
        enum Label {
            enum Title {
                static let textColor: UIColor = .blackColor
                static let font: UIFont = .montserratRegular16
                static let topAnchor: CGFloat = UiConstants.SMALL_SPACE
                static let leadingAnchor: CGFloat = UiConstants.SMALL_SPACE
            }
            enum Description {
                static let textColor: UIColor = .blackColor
                static let font: UIFont = .montserratRegular12
                static let topAnchor: CGFloat = UiConstants.SMALL_SPACE
                static let leadingAnchor: CGFloat = UiConstants.SMALL_SPACE
                static let trailingAnchor: CGFloat = -UiConstants.SMALL_SPACE
                static let bottomAnchor: CGFloat = -UiConstants.SMALL_SPACE
                static let heightAnchor: CGFloat = UiConstants.NORMAL_TEXTFIELD_DESCRIPTION_SIZE
            }
        }
        enum TextField {
            enum Left {
                static let font: UIFont = .montserratRegular16
                static let borderWidth: CGFloat = 1
                static let borderColor: CGColor = UIColor.systemGray.cgColor
                static let radius: CGFloat = 4
                static let widthAnchor: CGFloat = UiConstants.NORMAL_TEXTFIELD_WIDTH
            }
            enum Right {
                static let font: UIFont = .montserratRegular16
                static let borderWidth: CGFloat = 1
                static let borderColor: CGColor = UIColor.systemGray.cgColor
                static let radius: CGFloat = 4
            }
        }
        enum Button {
            enum State {
                static let trailingAnchor: CGFloat = -UiConstants.SMALL_SPACE
                static let widthAnchor: CGFloat = UiConstants.NORMAL_ICON_SIZE
                static let heightAnchor: CGFloat = UiConstants.NORMAL_ICON_SIZE
            }
        }
    }

    // MARK: - Outlets
    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = Constants.View.Container.color
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
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
        stackView.spacing = Constants.StackView.Horizontal.spacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var leftTextField: UITextField = {
        let textField = UITextField()
        textField.font = Constants.TextField.Left.font
        textField.layer.borderWidth = Constants.TextField.Left.borderWidth
        textField.layer.cornerRadius = Constants.TextField.Left.radius
        textField.layer.borderColor = Constants.TextField.Left.borderColor
        textField.setLeftPaddingPoints(UiConstants.NORMAL_SPACE)
        textField.setRightPaddingPoints(UiConstants.NORMAL_SPACE)
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
        textField.setLeftPaddingPoints(UiConstants.smallPaddingTextField)
        textField.setRightPaddingPoints(UiConstants.bigPaddingTextField)
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
                constant: Constants.View.Container.topAnchor),
            containerView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.View.Container.leadingAnchor),
            containerView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Constants.View.Container.trailingAnchor),
            containerView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Constants.View.Container.bottomAnchor)
        ]
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: Constants.Label.Title.topAnchor),
            titleLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Constants.Label.Title.leadingAnchor)
        ]
        let horizontalFieldStackViewConstraints = [
            horizontalFieldStackView.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: Constants.StackView.Horizontal.topAnchor),
            horizontalFieldStackView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Constants.StackView.Horizontal.leadingAnchor),
            horizontalFieldStackView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: Constants.StackView.Horizontal.trailingAnchor),
            horizontalFieldStackView.heightAnchor.constraint(
                equalToConstant: Constants.StackView.Horizontal.heightAnchor)
        ]
        let leftTextFieldConstraints = [
            leftTextField.widthAnchor.constraint(
                equalToConstant: Constants.TextField.Left.widthAnchor)
        ]
        let stateButtonConstraints = [
            stateButton.centerYAnchor.constraint(
                equalTo: rightTextField.centerYAnchor),
            stateButton.trailingAnchor.constraint(
                equalTo: rightTextField.trailingAnchor,
                constant: Constants.Button.State.trailingAnchor),
            stateButton.widthAnchor.constraint(
                equalToConstant: Constants.Button.State.widthAnchor),
            stateButton.heightAnchor.constraint(
                equalToConstant: Constants.Button.State.heightAnchor)
        ]
        let descriptionLabelConstraints = [
            descriptionLabel.topAnchor.constraint(
                equalTo: rightTextField.bottomAnchor,
                constant: Constants.Label.Description.topAnchor),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Constants.Label.Description.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: Constants.Label.Description.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: Constants.Label.Description.bottomAnchor),
            descriptionLabel.heightAnchor.constraint(
                equalToConstant: Constants.Label.Description.heightAnchor)
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
