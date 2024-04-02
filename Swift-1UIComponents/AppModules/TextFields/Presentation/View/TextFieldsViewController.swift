//
//  TextFieldsViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 25-03-24.
//

import UIKit

final class TextFieldsViewController: BaseViewController<TextFieldsViewModel, TextFieldsCoordinator> {

    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Dimensions.StackView.normalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var labeledButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(L10n.Textfield.labeledButton, for: .normal)
        button.style(like: .filled)
        button.onClick { [weak self] in
            self?.viewModel.goToLabeledView()
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var pickersButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(L10n.Textfield.pickerButton, for: .normal)
        button.style(like: .disable)
        button.onClick { [weak self] in
            self?.viewModel.goToLabeledView()
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
}

extension TextFieldsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configBindings()
    }
}

extension TextFieldsViewController {
    private func configUI() {
        configBasic(L10n.Textfield.title, Asset.Colors.whiteColor.color)
        configConstraints()
    }

    private func configConstraints() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(labeledButton)
        mainStackView.addArrangedSubview(pickersButton)

        let mainStackViewConstraints = [
            mainStackView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor),
            mainStackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Dimensions.Margin.normal),
            mainStackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Dimensions.Margin.normal),
        ]

        NSLayoutConstraint.activate(
            mainStackViewConstraints
        )
    }
}

extension TextFieldsViewController {
    func configBindings() {
        viewModel.$goTo.sink { [weak self] scene in
            guard let self = self, let scene = scene else { return }
            self.coordinator.goToScene(scene: scene, from: self)
        }.store(in: &anyCancellable)
    }
}
