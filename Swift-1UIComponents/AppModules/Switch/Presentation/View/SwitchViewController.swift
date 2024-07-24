//
//  SwitchViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 23-07-24.
//

import UIKit

final class SwitchViewController: BaseViewController<SwitchViewModel, SwitchCoordinator> {

    // Outlets
    private lazy var switchContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var switchTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body.body1
        label.text = L10n.Switch.label
        label.textColor = Asset.Colors.blackColor.color
        label.numberOfLines = Dimensions.Label.lines.one
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var mainSwitch: UISwitch = {
        let mainSwitch = UISwitch()
        mainSwitch.setOn(false, animated: true)
        mainSwitch.addTarget(self, action: #selector(toggleSwitch), for: .valueChanged)
        mainSwitch.translatesAutoresizingMaskIntoConstraints = false
        return mainSwitch
    }()
    private lazy var reactiveLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body.body1
        label.text = L10n.Switch.reactiveLabel
        label.textColor = .systemGray
        label.numberOfLines = Dimensions.Label.lines.one
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

// MARK: - Lifecycle
extension SwitchViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configBindings()
    }
}

// MARK: - Bindings
extension SwitchViewController {
    private func configBindings() {
        
    }
}

// MARK: - UI Functions
extension SwitchViewController {
    private func configUI() {
        configBasic(L10n.Switch.title, Asset.Colors.brandColor.color)
        configConstraints()
    }

    private func configConstraints() {
        view.addSubview(switchContainer)
        switchContainer.addSubview(switchTitleLabel)
        switchContainer.addSubview(mainSwitch)
        switchContainer.addSubview(reactiveLabel)

        let switchContainerConstraints = [
            switchContainer.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            switchContainer.leadingAnchor.constraint(
                equalTo: view.leadingAnchor),
            switchContainer.trailingAnchor.constraint(
                equalTo: view.trailingAnchor),
            switchContainer.bottomAnchor.constraint(
                equalTo: view.bottomAnchor)
        ]
        let switchTitleLabelConstraints = [
            switchTitleLabel.topAnchor.constraint(
                equalTo: switchContainer.topAnchor,
                constant: Dimensions.Margin.normal),
            switchTitleLabel.leadingAnchor.constraint(
                equalTo: switchContainer.leadingAnchor,
                constant: Dimensions.Margin.normal),
            switchTitleLabel.trailingAnchor.constraint(
                equalTo: mainSwitch.leadingAnchor,
                constant: -Dimensions.Margin.normal)
        ]
        let mainSwitchConstraints = [
            mainSwitch.centerYAnchor.constraint(
                equalTo: switchTitleLabel.centerYAnchor),
            mainSwitch.trailingAnchor.constraint(
                equalTo: switchContainer.trailingAnchor,
                constant: -Dimensions.Margin.small)
        ]
        let reactiveLabelConstraints = [
            reactiveLabel.topAnchor.constraint(
                equalTo: switchTitleLabel.bottomAnchor,
                constant: Dimensions.Margin.normal),
            reactiveLabel.leadingAnchor.constraint(
                equalTo: switchContainer.leadingAnchor,
                constant: Dimensions.Margin.normal),
            reactiveLabel.trailingAnchor.constraint(
                equalTo: switchContainer.trailingAnchor,
                constant: -Dimensions.Margin.normal)
        ]

        NSLayoutConstraint.activate(
            switchContainerConstraints +
            switchTitleLabelConstraints +
            mainSwitchConstraints +
            reactiveLabelConstraints
        )
    }
}

// MARK: - Action
extension SwitchViewController {
    @objc func toggleSwitch() {
        reactiveLabel.textColor = mainSwitch.isOn
            ? .systemGreen
            : .systemGray
    }
}
