//
//  LabeledTextFieldPickerView.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 25-05-23.
//

import UIKit

class LabeledTextFieldPickerView: UIView {
    private enum Constants {
        enum Label {
            enum Title {
                static let textColor: UIColor = .black
                static let font: UIFont = .montserratRegular16
            }
            enum Description {
                static let textColor: UIColor = .black
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
        view.backgroundColor = .systemYellow
        view.isUserInteractionEnabled = true
        return view
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Género"
        label.font = Constants.Label.Title.font
        label.textColor = Constants.Label.Title.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var mainTextField: UITextField = {
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
    private lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .whiteColor
        return pickerView
    }()


    // MARK: - Properties
    var pickerOptions: [String]?


    // MARK: - Config
    var item: LabeledTextFieldPickerViewArgs? {
        didSet {
            guard let item = item else { return }
            titleLabel.text = item.title
            pickerOptions = item.pickerOptions
            pickerView.reloadAllComponents()
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
    }
    

    // MARK: - UI Functions
    func setupUI() {
        configDelegates()
        configTextField()
        configConstraints()
    }

    private func configDelegates() {
        pickerView.delegate = self
    }

    private func configTextField() {
        mainTextField.inputView = pickerView
    }

    private func configConstraints() {
        addSubview(containerHeader)
        containerHeader.addSubview(titleLabel)
        containerHeader.addSubview(mainTextField)

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
                constant: UiConstants.SMALL_SPACE),
            titleLabel.leadingAnchor.constraint(
                equalTo: containerHeader.leadingAnchor,
                constant: UiConstants.SMALL_SPACE)
        ]
        let mainTextFieldConstraints = [
            mainTextField.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: UiConstants.SMALL_SPACE),
            mainTextField.leadingAnchor.constraint(
                equalTo: containerHeader.leadingAnchor,
                constant: UiConstants.SMALL_SPACE),
            mainTextField.trailingAnchor.constraint(
                equalTo: containerHeader.trailingAnchor,
                constant: -UiConstants.SMALL_SPACE),
            mainTextField.heightAnchor.constraint(
                equalToConstant: UiConstants.normalTextFieldSize),
            mainTextField.bottomAnchor.constraint(
                equalTo: containerHeader.bottomAnchor,
                constant: -UiConstants.BIG_SPACE)
        ]

        NSLayoutConstraint.activate(
            containerHeaderConstraints +
            titleLabelConstraints +
            mainTextFieldConstraints
        )
    }
}

extension LabeledTextFieldPickerView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerOptions?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerOptions?[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        mainTextField.text = pickerOptions?[row]
    }
}
