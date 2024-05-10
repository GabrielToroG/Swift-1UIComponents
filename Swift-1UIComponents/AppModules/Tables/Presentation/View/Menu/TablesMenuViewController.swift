//
//  TablesMenuViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 01-04-24.
//

import Foundation
import UIKit

final class TablesMenuViewController: BaseViewController<TablesViewModel, TablesViewCoordinator> {

    // Outlets
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Dimensions.StackView.normalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var stickyHeadersButton: UIButton = {
        let button = UIButton(type: .system)
        button.style(like: .filled)
        button.setTitle(L10n.Tableview.stickyHeaders, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.onClick { [weak self] in
            guard let self = self else { return }
            self.viewModel.goToStickyHeadersView()
        }
        return button
    }()
    private lazy var scrollableHeadersButton: UIButton = {
        let button = UIButton(type: .system)
        button.style(like: .filled)
        button.setTitle(L10n.Tableview.scrollableHeaders, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.onClick { [weak self] in
            guard let self = self else { return }
            self.viewModel.goToScrollableHeadersView()
        }
        return button
    }()
    private lazy var reactiveSectionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.style(like: .filled)
        button.setTitle(L10n.Tableview.reactiveSections, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.onClick { [weak self] in
            guard let self = self else { return }
            self.viewModel.goToReactiveSectionsView()
        }
        return button
    }()
    private lazy var editableCellsButton: UIButton = {
        let button = UIButton(type: .system)
        button.style(like: .filled)
        button.setTitle(L10n.Tableview.editableCells, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.onClick { [weak self] in
            guard let self = self else { return }
            self.viewModel.goToEditableCellsView()
        }
        return button
    }()
}

// MARK: - Lifecycle
extension TablesMenuViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configBindings()
        viewModel.onViewDidLoad()
    }
}

// MARK: - Bindings
extension TablesMenuViewController {
    private func configBindings() {
        viewModel.$goTo.sink { [weak self] scene in
            guard let self = self, let scene = scene else { return }
            self.coordinator.goToScene(scene: scene, from: self)
        }.store(in: &anyCancellable)
    }
}

// MARK: - UI Functions
extension TablesMenuViewController {
    private func configUI() {
        configBasic(L10n.Tableview.title, Asset.Colors.whiteColor.color)
        configConstraints()
    }

    private func configConstraints() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(stickyHeadersButton)
        mainStackView.addArrangedSubview(scrollableHeadersButton)
        mainStackView.addArrangedSubview(reactiveSectionsButton)
        mainStackView.addArrangedSubview(editableCellsButton)

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
