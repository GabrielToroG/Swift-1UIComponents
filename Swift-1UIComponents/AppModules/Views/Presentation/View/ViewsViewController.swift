//
//  ViewsViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 04-03-24.
//

import UIKit

final class ViewsViewController: BaseViewController<ViewsViewModel, ViewsCoordinator> {
    // Outlets
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Dimensions.StackView.normalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var shadowView: ViewWithShadow = {
        let view = ViewWithShadow()
        view.backgroundColor = Asset.Colors.whiteColor.color
        view.config(ViewWithShadowArgs())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var shadowLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body.body1
        label.text = L10n.Views.shadowTitle
        label.textColor = Asset.Colors.blackColor.color
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var viewWithConfigView: ViewWithConfigView = {
        let view = ViewWithConfigView()
        view.config(
            backgroundColor: Asset.Colors.brownColor.color,
            titleText: L10n.Views.configText,
            image: Asset.Views.viewsStar.image,
            imageTintColor: Asset.Colors.grayColor.color)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var viewWithActionsView: ViewWithActionView = {
        let view = ViewWithActionView()
        view.didTapImageView = { [weak self] in
            guard let self = self else { return }
            self.viewModel.showAlert()
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}

// MARK: - Lifecycle
extension ViewsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configBindings()
        viewModel.onViewDidLoad()
    }
}

// MARK: - Bindings
extension ViewsViewController {
    private func configBindings() {
        viewModel.$goTo.sink { [weak self] scene in
            guard let self = self, let scene = scene else { return }
            self.coordinator.goToScene(scene: scene, from: self)
        }.store(in: &anyCancellable)
    }
}

// MARK: - UI Functions
extension ViewsViewController {
    private func configUI() {
        configBasic(L10n.Views.title, Asset.Colors.whiteColor.color)
        configConstraints()
    }

    private func configConstraints() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(shadowView)
        shadowView.addSubview(shadowLabel)
        mainStackView.addArrangedSubview(viewWithConfigView)
        mainStackView.addArrangedSubview(viewWithActionsView)

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
        let shadowViewConstraints = [
            shadowView.heightAnchor.constraint(
                equalToConstant: Dimensions.View.normalSize)
        ]
        let shadowLabelConstraints = [
            shadowLabel.centerYAnchor.constraint(
                equalTo: shadowView.centerYAnchor),
            shadowLabel.leadingAnchor.constraint(
                equalTo: shadowView.leadingAnchor,
                constant: Dimensions.Margin.small),
            shadowLabel.trailingAnchor.constraint(
                equalTo: shadowView.trailingAnchor,
                constant: -Dimensions.Margin.small),
        ]

        NSLayoutConstraint.activate(
            mainStackViewConstraints +
            shadowViewConstraints +
            shadowLabelConstraints
        )
    }
}
