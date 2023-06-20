//
//  ToastView.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 05-06-23.
//

import UIKit

class ToastView: UIView {
    private enum Constants {
        enum View {
            enum Container {
                static let color: UIColor = .blackColor
                static let cornerRadius: CGFloat = UiConstants.SMALL_CORNER_RADIUS
                static let topAnchor: CGFloat = UiConstants.NO_SPACE
                static let leadingAnchor: CGFloat = UiConstants.EXTREME_SPACE
                static let trailingAnchor: CGFloat = -UiConstants.EXTREME_SPACE
                static let heightAnchor: CGFloat = UiConstants.NORMAL_TOAST_SIZE
            }
        }
        enum ImageView {
            enum Icon {
                static let color: UIColor = .whiteColor
                static let image: UIImage? = UIImage(named: "general.toast.info")
                static let leadingAnchor: CGFloat = UiConstants.SMALL_SPACE
                static let widthAnchor: CGFloat = UiConstants.SMALL_ICON_SIZE
                static let heightAnchor: CGFloat = UiConstants.SMALL_ICON_SIZE
            }
        }
        enum Label {
            enum Message {
                static let text: String = "La lista ha sido eliminada."
                static let textColor: UIColor = .whiteColor
                static let font: UIFont = .montserratRegular13
                static let leadingAnchor: CGFloat = UiConstants.SMALL_SPACE
                static let trailingAnchor: CGFloat = -UiConstants.SMALL_SPACE
            }
        }
    }

    // MARK: - Outlets
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.View.Container.color
        view.layer.cornerRadius = Constants.View.Container.cornerRadius
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.ImageView.Icon.image
        imageView.tintColor = Constants.ImageView.Icon.color
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Label.Message.text
        label.textColor = Constants.Label.Message.textColor
        label.font = Constants.Label.Message.font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Functions
    private func setupViews() {
        addSubview(containerView)
        containerView.addSubview(iconImageView)
        containerView.addSubview(messageLabel)

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
            containerView.heightAnchor.constraint(
                equalToConstant: Constants.View.Container.heightAnchor)
        ]
        let iconImageViewConstraints = [
            iconImageView.centerYAnchor.constraint(
                equalTo: containerView.centerYAnchor),
            iconImageView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Constants.ImageView.Icon.leadingAnchor),
            iconImageView.widthAnchor.constraint(
                equalToConstant: Constants.ImageView.Icon.widthAnchor),
            iconImageView.heightAnchor.constraint(
                equalToConstant: Constants.ImageView.Icon.heightAnchor)
        ]
        let textLabelConstraints = [
            messageLabel.centerYAnchor.constraint(
                equalTo: containerView.centerYAnchor),
            messageLabel.leadingAnchor.constraint(
                equalTo: iconImageView.trailingAnchor,
                constant: Constants.Label.Message.leadingAnchor),
            messageLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: Constants.Label.Message.trailingAnchor)
        ]

        NSLayoutConstraint.activate(
            containerViewConstraints +
            iconImageViewConstraints +
            textLabelConstraints
        )
    }
}
