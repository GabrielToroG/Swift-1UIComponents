//
//  LoaderView.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-05-23.
//

import UIKit

// MARK: - Class
class LoaderView: UIView {
    private enum Constants {
        enum View {
            enum Container {
                static let color: UIColor = UiConstants.transparentBackgroundColor
            }
            enum ContainerProgressBar {
                static let color: UIColor = UiConstants.primaryLoaderColor
                static let radius: CGFloat = UiConstants.SMALL_RADIUS
            }
        }
        enum ImageView {
            enum Logo {
                static let image: UIImage? = UIImage(named: "general-logo")
                static let contentMode: ContentMode = .scaleAspectFit
            }
        }
    }
    
    // Outlets
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
    private lazy var progressContainerView: UIView = {
        let view = UIView()
        view.layer.borderWidth = Constants.View.ContainerProgressBar.radius
        view.layer.borderColor = Constants.View.ContainerProgressBar.color.cgColor
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
        configViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
                constant: UiConstants.NO_SPACE),
            containerView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: UiConstants.NO_SPACE),
            containerView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: UiConstants.NO_SPACE),
            containerView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: UiConstants.NO_SPACE)
        ]
        let logoContainerViewConstraints = [
            logoContainerView.centerYAnchor.constraint(
                equalTo: containerView.centerYAnchor),
            logoContainerView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: UiConstants.EXTREME_SPACE),
            logoContainerView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -UiConstants.EXTREME_SPACE)
        ]
        let logoImageViewConstraints = [
            logoImageView.centerXAnchor.constraint(
                equalTo: logoContainerView.centerXAnchor),
            logoImageView.topAnchor.constraint(
                equalTo: logoContainerView.topAnchor,
                constant: UiConstants.NORMAL_SPACE),
            logoImageView.heightAnchor.constraint(
                equalToConstant: UiConstants.NORMAL_SIZE_LOGO),
            logoImageView.widthAnchor.constraint(
                equalToConstant: UiConstants.NORMAL_SIZE_LOGO)
        ]
        let progressContainerViewConstraints = [
            progressContainerView.topAnchor.constraint(
                equalTo: logoImageView.bottomAnchor,
                constant: UiConstants.BIG_SPACE),
            progressContainerView.leadingAnchor.constraint(
                equalTo: logoContainerView.leadingAnchor,
                constant: UiConstants.NORMAL_SPACE),
            progressContainerView.trailingAnchor.constraint(
                equalTo: logoContainerView.trailingAnchor,
                constant: -UiConstants.NORMAL_SPACE),
            progressContainerView.bottomAnchor.constraint(
                equalTo: logoContainerView.bottomAnchor,
                constant: -UiConstants.BIG_SPACE),
            progressContainerView.heightAnchor.constraint(
                equalToConstant: UiConstants.NORMAL_HEIGHT_LOADER)
        ]
        let progressViewConstraints = [
            progressView.topAnchor.constraint(
                equalTo: progressContainerView.topAnchor,
                constant: 0),
            progressView.leadingAnchor.constraint(
                equalTo: progressContainerView.leadingAnchor,
                constant: 0),
            progressView.trailingAnchor.constraint(
                equalTo: progressContainerView.trailingAnchor,
                constant: 0),
            progressView.bottomAnchor.constraint(
                equalTo: progressContainerView.bottomAnchor,
                constant: 0)
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

    func stopProgressAnimation() {
        progressView.stopProgressAnimation()
    }
}
