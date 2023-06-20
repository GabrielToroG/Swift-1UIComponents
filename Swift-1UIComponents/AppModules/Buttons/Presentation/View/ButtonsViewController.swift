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
                static let imagePadding: CGFloat = UiConstants.TINY_SPACE
                static let textColor: UIColor = .systemGray
                static let color: UIColor = .clear
            }
            enum RightImage {
                static let text: String = "button.right.image.button".localized()
                static let image: UIImage? = UIImage(systemName: "chevron.right")
                static let imagePadding: CGFloat = UiConstants.TINY_SPACE
                static let textColor: UIColor = .systemGray
                static let color: UIColor = .clear
            }
        }
    }

    // MARK: - Properties
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = UiConstants.NORMAL_SPACE
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var filledButton: UIButton = {
        let button = UIButton(type: .system)
        button.style(like: .filled)
        button.setTitle("Filled Button", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var filledShadowButton: UIButton = {
        let button = UIButton(type: .system)
        button.style(like: .shadowFilled)
        button.setTitle("Filled Shadow Button", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var borderedButton: UIButton = {
        let button = UIButton(type: .system)
        button.style(like: .bordered)
        button.setTitle("Bordered Button", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
//    private lazy var
    private lazy var circleButton: CircleButton = {
        let button = CircleButton()
        button.item = .init()
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
        mainStackView.addArrangedSubview(filledButton)
        mainStackView.addArrangedSubview(filledShadowButton)
        mainStackView.addArrangedSubview(borderedButton)
        mainStackView.addArrangedSubview(circleButton)
        mainStackView.addArrangedSubview(leftImageButton)
        mainStackView.addArrangedSubview(rightImageButton)

        let mainStackViewConstraints = [
            mainStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: UiConstants.NORMAL_SPACE),
            mainStackView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -UiConstants.NORMAL_SPACE)
        ]

        NSLayoutConstraint.activate(mainStackViewConstraints)
    }
}
