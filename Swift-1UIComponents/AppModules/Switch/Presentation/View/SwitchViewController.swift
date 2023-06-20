//
//  SwitchViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 28-05-23.
//

import UIKit

class SwitchViewController: BaseViewController<SwitchViewModel> {
    private enum Constants {
        enum Base {
            enum General {
                static let title: String = "switch.title".localized()
                static let color: UIColor = .brandColor
            }
        }
        enum Label {
            enum Main {
                static let textOn: String = "switch.on".localized()
                static let textOff: String = "switch.off".localized()
            }
        }
    }
    // MARK: - Properties
    
    // MARK: - Outlets
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = UiConstants.SMALL_SPACE
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var mainSwitchLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Label.Main.textOff
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var mainSwitch: UISwitch = {
        let mainSwitch = UISwitch()
        mainSwitch.translatesAutoresizingMaskIntoConstraints = false
        return mainSwitch
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configActions()
    }
    
    // MARK: - UI Functions
    private func configUI() {
        configBasic(Constants.Base.General.title, Constants.Base.General.color)
        configConstraints()
    }
    private func configConstraints() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(mainSwitchLabel)
        mainStackView.addArrangedSubview(mainSwitch)
        let mainStackViewConstraints = [
            mainStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: UiConstants.SMALL_SPACE),
            mainStackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: UiConstants.NORMAL_SPACE),
            mainStackView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -UiConstants.NORMAL_SPACE)
        ]
        NSLayoutConstraint.activate(mainStackViewConstraints)
    }
    
    private func configActions() {
        mainSwitch.addTarget(self, action: #selector(updateSwitch), for: .valueChanged)
    }
    @objc func updateSwitch() {
        mainSwitchLabel.text = mainSwitch.isOn ? Constants.Label.Main.textOn : Constants.Label.Main.textOff
    }

}
