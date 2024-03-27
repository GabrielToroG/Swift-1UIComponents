//
//  ButtonsViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 05-03-24.
//

import Foundation

import UIKit

final class ButtonsViewController: BaseViewController<ButtonsViewModel, ButtonsCoordinator> {
    
    // Outlets
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Dimensions.StackView.normalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var filledButton: UIButton = {
        let button = UIButton(type: .system)
        button.style(like: .filled)
        button.setTitle(L10n.Button.filled, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var filledShadowButton: UIButton = {
        let button = UIButton(type: .system)
        button.style(like: .shadowFilled)
        button.setTitle(L10n.Button.filledShadow, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var borderedButton: UIButton = {
        let button = UIButton(type: .system)
        button.style(like: .bordered)
        button.setTitle(L10n.Button.bordered, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    // Properties
}

// MARK: - Lifecycle
extension ButtonsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configBindings()
        viewModel.onViewDidLoad()
    }
}

// MARK: - Bindings
extension ButtonsViewController {
    private func configBindings() {
        
    }
}

// MARK: - UI Functions
extension ButtonsViewController {
    private func configUI() {
        configBasic(L10n.Button.title, Asset.Colors.whiteColor.color)
        configConstraints()
    }
    
    private func configConstraints() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(filledButton)
        mainStackView.addArrangedSubview(filledShadowButton)
        mainStackView.addArrangedSubview(borderedButton)

        let mainStackViewConstraints = [
            mainStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Dimensions.Margin.normal),
            mainStackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: Dimensions.Margin.normal),
            mainStackView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -Dimensions.Margin.normal)
        ]

        NSLayoutConstraint.activate(mainStackViewConstraints)
    }
}
