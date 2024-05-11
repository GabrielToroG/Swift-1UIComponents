//
//  LabeledProgressBarView.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 27-03-24.
//

import UIKit

final class LabeledProgressBarView: UIView {

    // Outlets
    private lazy var containerView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = Dimensions.StackView.smallSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body.body4
        label.textColor = Asset.Colors.blackColor.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var progressContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var progressView: RoundedProgressBar = {
        let progressView = RoundedProgressBar()
        progressView.backgroundColor = Asset.Colors.darkGreyColor.color
        progressView.tintColor = .systemGreen
        progressView.layer.cornerRadius = Dimensions.BorderRadius.normal
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    private lazy var gradientProgressView: GradientProgressBar = {
        let progressView = GradientProgressBar()
        progressView.backgroundColor = Asset.Colors.darkGreyColor.color
        progressView.layer.cornerRadius = Dimensions.BorderRadius.normal
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    private lazy var discountLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body.body3
        label.textColor = Asset.Colors.blackColor.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Init
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configUI()
    }

    // Config
    func config(
        title: String,
        discount: Int,
        gradientColor: [UIColor] = []
    ) {
        titleLabel.text = title

        let progressBar: BaseProgressBar
        if gradientColor.isEmpty {
            progressBar = progressView
            progressView.configure(progress: Float(discount)/Dimensions.ProgressBar.toDecimal)
        } else {
            progressBar = gradientProgressView
            gradientProgressView.configure(
                progress: Float(discount)/Dimensions.ProgressBar.toDecimal,
                gradientColors: [.red, .green],
                gradientDirection: .leftBottomToRightTop)
        }
        addProgressBar(progressBar)
        discountLabel.text = "\(discount)%"
    }

    private func addProgressBar(_ progressBar: BaseProgressBar) {
        let progressBarView = progressBar as! UIView
        progressContainerView.addSubview(progressBarView)

        progressBarView.leadingAnchor.constraint(
            equalTo: progressContainerView.leadingAnchor,
            constant: Dimensions.Margin.tiny).isActive = true
        progressBarView.trailingAnchor.constraint(
            equalTo: progressContainerView.trailingAnchor,
            constant: -Dimensions.Margin.tiny).isActive = true
        progressBarView.centerYAnchor.constraint(
            equalTo: progressContainerView.centerYAnchor).isActive = true
        progressBarView.heightAnchor.constraint(
            equalToConstant: Dimensions.ProgressBar.Height.normal).isActive = true
    }
}

extension LabeledProgressBarView {
    private func configUI() {
        configConstraints()
    }

    private func configConstraints() {
        addSubview(containerView)
        containerView.addArrangedSubview(titleLabel)
        containerView.addArrangedSubview(progressContainerView)
        containerView.addArrangedSubview(discountLabel)

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
                equalToConstant: Dimensions.ProgressBar.Height.medium)
        ]
        let titleLabelConstraints = [
            titleLabel.widthAnchor.constraint(
                equalToConstant: Dimensions.Label.Width.normal)
        ]

        NSLayoutConstraint.activate(
            containerViewConstraints +
            titleLabelConstraints
        )
    }
}
