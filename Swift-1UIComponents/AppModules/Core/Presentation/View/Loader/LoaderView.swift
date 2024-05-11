//
//  LoaderView.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-02-24.
//

import UIKit

class LoaderView: UIView {

    // Outlets
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.Colors.transparentColor.color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var logoContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.General.generalLogo.image
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var progressContainerView: UIView = {
        let view = UIView()
        view.layer.borderWidth = Dimensions.BorderWidth.minimum
        view.layer.borderColor = Asset.Colors.yellowColor.color.cgColor
        view.layer.cornerRadius = Dimensions.LoaderView.barCorner
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var progressView: ProgressBarView = {
        let progressView = ProgressBarView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()

    // Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        awakeFromNib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configViews()
    }
}

// MARK: - UI Functions
extension LoaderView {
    private func configViews() {
        addSubview(containerView)
        containerView.addSubview(logoContainerView)
        logoContainerView.addSubview(logoImageView)
        logoContainerView.addSubview(progressContainerView)
        progressContainerView.addSubview(progressView)

        let containerViewConstraints = [
            containerView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Dimensions.Margin.zero),
            containerView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Dimensions.Margin.zero),
            containerView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Dimensions.Margin.zero),
            containerView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Dimensions.Margin.zero)
        ]
        let logoContainerViewConstraints = [
            logoContainerView.centerYAnchor.constraint(
                equalTo: containerView.centerYAnchor),
            logoContainerView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Dimensions.Margin.extraLarge),
            logoContainerView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -Dimensions.Margin.extraLarge)
        ]
        let logoImageViewConstraints = [
            logoImageView.centerXAnchor.constraint(
                equalTo: logoContainerView.centerXAnchor),
            logoImageView.topAnchor.constraint(
                equalTo: logoContainerView.topAnchor,
                constant: Dimensions.Margin.normal),
            logoImageView.heightAnchor.constraint(
                equalToConstant: Dimensions.LoaderView.logoSize),
            logoImageView.widthAnchor.constraint(
                equalToConstant: Dimensions.LoaderView.logoSize)
        ]
        let progressContainerViewConstraints = [
            progressContainerView.topAnchor.constraint(
                equalTo: logoImageView.bottomAnchor,
                constant: Dimensions.Margin.medium),
            progressContainerView.leadingAnchor.constraint(
                equalTo: logoContainerView.leadingAnchor,
                constant: Dimensions.Margin.normal),
            progressContainerView.trailingAnchor.constraint(
                equalTo: logoContainerView.trailingAnchor,
                constant: -Dimensions.Margin.normal),
            progressContainerView.bottomAnchor.constraint(
                equalTo: logoContainerView.bottomAnchor,
                constant: -Dimensions.Margin.medium),
            progressContainerView.heightAnchor.constraint(
                equalToConstant: Dimensions.LoaderView.barHeight)
        ]
        let progressViewConstraints = [
            progressView.topAnchor.constraint(
                equalTo: progressContainerView.topAnchor,
                constant: Dimensions.Margin.zero),
            progressView.leadingAnchor.constraint(
                equalTo: progressContainerView.leadingAnchor,
                constant: Dimensions.LoaderView.horizontalPadding),
            progressView.trailingAnchor.constraint(
                equalTo: progressContainerView.trailingAnchor,
                constant: -Dimensions.LoaderView.horizontalPadding),
            progressView.bottomAnchor.constraint(
                equalTo: progressContainerView.bottomAnchor,
                constant: Dimensions.Margin.zero)
        ]

        NSLayoutConstraint.activate(
            containerViewConstraints +
            logoContainerViewConstraints +
            logoImageViewConstraints +
            progressContainerViewConstraints +
            progressViewConstraints
        )
    }
}

extension LoaderView {
    func startProgressAnimation() {
        progressView.startProgressAnimation()
    }
}
