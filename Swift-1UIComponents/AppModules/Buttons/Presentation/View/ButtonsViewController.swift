//
//  ButtonsViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 12-05-23.
//

import UIKit

class ButtonsViewController: BaseViewController<ButtonsViewModel> {
    private enum Constants {
        enum Base {
            enum General {
                static let text: String = "button.title".localized()
                static let color: UIColor = .brandColor
            }
        }
        enum Button {
            enum Primary {
                static let text: String = "button.primary".localized()
            }
            enum Secondary {
                static let text: String = "button.secondary".localized()
            }
            enum LeftImage {
                static let text: String = "button.left.image.button".localized()
                static let image: UIImage? = UIImage(systemName: "chevron.left")
                static let imagePadding: CGFloat = UiConstants.tinySpace
                static let textColor: UIColor = .systemGray
                static let color: UIColor = .clear
            }
            enum RightImage {
                static let text: String = "button.right.image.button".localized()
                static let image: UIImage? = UIImage(systemName: "chevron.right")
                static let imagePadding: CGFloat = UiConstants.tinySpace
                static let textColor: UIColor = .systemGray
                static let color: UIColor = .clear
            }
        }
    }

    // MARK: - Properties
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = UiConstants.normalSpace
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var primaryButton: FillerButton = {
        let button = FillerButton()
        button.item = .init(
            title: Constants.Button.Primary.text)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var secondaryButton: BorderButton = {
        let button = BorderButton()
        button.item = .init(
            title: Constants.Button.Primary.text)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var leftImageButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.title = Constants.Button.LeftImage.text
        config.image = Constants.Button.LeftImage.image
        config.imagePadding = Constants.Button.LeftImage.imagePadding
        config.imagePlacement = .leading
        let button = UIButton(configuration: config)
        button.tintColor = Constants.Button.LeftImage.textColor
        button.backgroundColor = Constants.Button.LeftImage.color
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var rightImageButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.title = Constants.Button.RightImage.text
        config.image = Constants.Button.RightImage.image
        config.imagePlacement = .trailing
        config.imagePadding = Constants.Button.RightImage.imagePadding
        let button = UIButton(configuration: config)
        button.tintColor = Constants.Button.RightImage.textColor
        button.backgroundColor = Constants.Button.RightImage.color
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

    // MARK: - UI Functions
    private func configUI() {
        configBasic(Constants.Base.General.text, Constants.Base.General.color)
        configConstraints()
    }

    private func configConstraints() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(primaryButton)
        mainStackView.addArrangedSubview(secondaryButton)
        mainStackView.addArrangedSubview(leftImageButton)
        mainStackView.addArrangedSubview(rightImageButton)

        let mainStackViewConstraints = [
            mainStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: UiConstants.normalSpace),
            mainStackView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -UiConstants.normalSpace)
        ]

        NSLayoutConstraint.activate(mainStackViewConstraints)
    }
}
