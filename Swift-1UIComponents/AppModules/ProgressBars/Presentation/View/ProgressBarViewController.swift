//
//  ProgressBarViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 27-03-24.
//

import UIKit

final class ProgressBarViewController: BaseViewController<ProgressBarViewModel, ProgressBarCoordinator> {

    // Outlets
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Dimensions.StackView.normalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var labeledProgressBar: LabeledProgressBarView = {
        let progressBar = LabeledProgressBarView()
        progressBar.config(
            title: L10n.ProgressBar.rounded,
            discount: Dimensions.ProgressBar.Progress.twoQuarter,
            gradientColor: [])
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBar
    }()
    private lazy var labeledGradientProgressBar: LabeledProgressBarView = {
        let progressBar = LabeledProgressBarView()
        progressBar.config(
            title: L10n.ProgressBar.gradient,
            discount: Dimensions.ProgressBar.Progress.threeQuarter,
            gradientColor: [.red, .yellow])
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBar
    }()
}

extension ProgressBarViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
}

extension ProgressBarViewController {
    private func configUI() {
        configBasic(L10n.ProgressBar.title, Asset.Colors.brandColor.color)
        configConstraints()
    }

    private func configConstraints() {
        view.addSubview(containerStackView)
        containerStackView.addArrangedSubview(labeledProgressBar)
        containerStackView.addArrangedSubview(labeledGradientProgressBar)

        let containerStackViewConstraints = [
            containerStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Dimensions.Margin.normal),
            containerStackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Dimensions.Margin.normal),
            containerStackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Dimensions.Margin.normal)
        ]

        NSLayoutConstraint.activate(
            containerStackViewConstraints
        )
    }
}
