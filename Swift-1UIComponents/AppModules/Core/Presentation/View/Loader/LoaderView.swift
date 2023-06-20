//
//  LoaderView.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-05-23.
//

import UIKit

class LoaderView: UIView {
    private enum Constants {
        enum View {
            enum Container {
                static let color: UIColor = .blackColor
                static let topAnchor: CGFloat = UiConstants.NO_SPACE
                static let leadingAnchor: CGFloat = UiConstants.NO_SPACE
                static let trailingAnchor: CGFloat = UiConstants.NO_SPACE
                static let bottomAnchor: CGFloat = UiConstants.NO_SPACE
            }
            enum LogoContainer {
                static let leadingAnchor: CGFloat = UiConstants.EXTREME_SPACE
                static let trailingAnchor: CGFloat = -UiConstants.EXTREME_SPACE
            }
        }
        enum ImageView {
            enum Logo {
                static let image: UIImage? = UIImage(named: "general-logo")
                static let contentMode: ContentMode = .scaleAspectFit
                static let topAnchor: CGFloat = UiConstants.NORMAL_SPACE
                static let heightAnchor: CGFloat = UiConstants.NORMAL_LOGO_SIZE
                static let widthAnchor: CGFloat = UiConstants.NORMAL_LOGO_SIZE
            }
        }
        enum Custom {
            enum ProgressBar {
                static let topAnchor: CGFloat = UiConstants.BIG_SPACE
                static let leadingAnchor: CGFloat = UiConstants.NORMAL_SPACE
                static let trailingAnchor: CGFloat = -UiConstants.NORMAL_SPACE
                static let bottomAnchor: CGFloat = -UiConstants.BIG_SPACE
                static let heightAnchor: CGFloat = UiConstants.NORMAL_LOADER_HEIGHT
            }
        }
    }

    // MARK: - Outlets
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.View.Container.color
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
        imageView.image = Constants.ImageView.Logo.image
        imageView.contentMode = Constants.ImageView.Logo.contentMode
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var progressView: ProgressBarView = {
        let progressView = ProgressBarView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Functions
    private func configViews() {
        addSubview(containerView)
        containerView.addSubview(logoContainerView)
        logoContainerView.addSubview(logoImageView)
        logoContainerView.addSubview(progressView)

        let containerViewConstraints = [
            containerView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Constants.View.Container.topAnchor),
            containerView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.View.Container.leadingAnchor),
            containerView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Constants.View.Container.trailingAnchor),
            containerView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Constants.View.Container.bottomAnchor)
        ]
        let logoContainerViewConstraints = [
            logoContainerView.centerYAnchor.constraint(
                equalTo: containerView.centerYAnchor),
            logoContainerView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Constants.View.LogoContainer.leadingAnchor),
            logoContainerView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: Constants.View.LogoContainer.trailingAnchor)
        ]
        let logoImageViewConstraints = [
            logoImageView.centerXAnchor.constraint(
                equalTo: logoContainerView.centerXAnchor),
            logoImageView.topAnchor.constraint(
                equalTo: logoContainerView.topAnchor,
                constant: Constants.ImageView.Logo.topAnchor),
            logoImageView.heightAnchor.constraint(
                equalToConstant: Constants.ImageView.Logo.heightAnchor),
            logoImageView.widthAnchor.constraint(
                equalToConstant: Constants.ImageView.Logo.widthAnchor)
        ]
        let progressViewConstraints = [
            progressView.topAnchor.constraint(
                equalTo: logoImageView.bottomAnchor,
                constant: Constants.Custom.ProgressBar.topAnchor),
            progressView.leadingAnchor.constraint(
                equalTo: logoContainerView.leadingAnchor,
                constant: Constants.Custom.ProgressBar.leadingAnchor),
            progressView.trailingAnchor.constraint(
                equalTo: logoContainerView.trailingAnchor,
                constant: Constants.Custom.ProgressBar.trailingAnchor),
            progressView.bottomAnchor.constraint(
                equalTo: logoContainerView.bottomAnchor,
                constant: Constants.Custom.ProgressBar.bottomAnchor),
            progressView.heightAnchor.constraint(
                equalToConstant: Constants.Custom.ProgressBar.heightAnchor)
        ]

        NSLayoutConstraint.activate(
            containerViewConstraints +
            logoContainerViewConstraints +
            logoImageViewConstraints +
            progressViewConstraints
        )
    }
    
    func startProgressAnimation() {
        progressView.startProgressAnimation()
    }

    func stopProgressAnimation() {
        progressView.stopProgressAnimation()
    }
}
