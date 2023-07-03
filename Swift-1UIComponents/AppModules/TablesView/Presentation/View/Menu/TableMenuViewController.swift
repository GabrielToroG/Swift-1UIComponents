//
//  TableMenuViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-07-23.
//

import Foundation

import UIKit

class TableMenuViewController: BaseViewController<TableMenuViewModel> {
    private enum Constants {
        enum Base {
            enum General {
                static let title: String = "Table View Menú"
                static let color: UIColor = UiConstants.primaryBackgroundColor
            }
        }
    }

    // MARK: - Properties
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = UiConstants.NORMAL_SPACE
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var typesButton: UIButton = {
        let button = UIButton(type: .system)
        button.style(like: .filled)
        button.setTitle("Tipos de Table View", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.onClick { [weak self] in
            guard let self = self else { return }
            self.coordinator.pushViewController(newViewControllerType: PlainTableViewViewController.self)
        }
        return button
    }()
    private lazy var editModeButton: UIButton = {
        let button = UIButton(type: .system)
        button.style(like: .filled)
        button.setTitle("Edición de Table View", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.onClick { [weak self] in
            guard let self = self else { return }
            self.coordinator.pushViewController(newViewControllerType: PlainTableViewViewController.self)
        }
        return button
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - UI Functions
    private func configUI() {
        configBasic(Constants.Base.General.title, Constants.Base.General.color)
        configConstraints()
    }
    private func configConstraints() {
        view.addSubview(containerStackView)
        containerStackView.addArrangedSubview(typesButton)
        containerStackView.addArrangedSubview(editModeButton)
        let containerStackViewConstraints = [
            containerStackView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor),
            containerStackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: UiConstants.NORMAL_SPACE),
            containerStackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -UiConstants.NORMAL_SPACE)
        ]
        NSLayoutConstraint.activate(
            containerStackViewConstraints
        )
    }
}
