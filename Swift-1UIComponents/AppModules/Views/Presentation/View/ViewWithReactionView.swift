//
//  ViewWithReactionView.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 09-05-24.
//

import UIKit

final class ViewWithReactionView: UIView {

    // Outlets
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemOrange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var editButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Editar", for: .normal)
        button.setTitleColor(Asset.Colors.blackColor.color, for: .normal)
        button.titleLabel?.font = Fonts.Button.button1
        button.onClick { [weak self] in
            self?.didTapEditButton?()
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var markAllButton: UIButton = {
        let button = UIButton(type: .custom)
        button.isHidden = true
        button.setTitle("Marcar todos", for: .normal)
        button.setTitleColor(Asset.Colors.blackColor.color, for: .normal)
        button.titleLabel?.font = Fonts.Button.button1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // Properties
    private var didTapEditButton: (() -> Void)?

    // Init
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configUI()
    }
}

// MARK: - Config
extension ViewWithReactionView {
    func config(didTapEditButton: @escaping () -> Void) {
        self.didTapEditButton = didTapEditButton
    }
}

// MARK: - UI
extension ViewWithReactionView {
    func configUI() {
        configConstraints()
    }

    private func configConstraints() {
        addSubview(containerView)
        containerView.addSubview(editButton)
        containerView.addSubview(markAllButton)

        let containerViewConstraints = [
            containerView.topAnchor.constraint(
                equalTo: topAnchor),
            containerView.leadingAnchor.constraint(
                equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(
                equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(
                equalTo: bottomAnchor),
            containerView.heightAnchor.constraint(
                equalToConstant: Dimensions.View.normalSize)
        ]
        let editButtonConstraints = [
            editButton.centerYAnchor.constraint(
                equalTo: containerView.centerYAnchor),
            editButton.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -Dimensions.Margin.normal)
        ]
        let markAllButtonConstraints = [
            markAllButton.centerYAnchor.constraint(
                equalTo: containerView.centerYAnchor),
            markAllButton.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Dimensions.Margin.normal)
        ]

        NSLayoutConstraint.activate(
            containerViewConstraints +
            editButtonConstraints +
            markAllButtonConstraints
        )
    }
}

// MARK: - Complementary UI
extension ViewWithReactionView {
    func editMode(editing: Bool) {
        if editing {
            editButton.setTitle("Cancelar", for: .normal)
            markAllButton.isHidden = false
        } else {
            editButton.setTitle("Editar", for: .normal)
            markAllButton.isHidden = true
        }
    }
}
