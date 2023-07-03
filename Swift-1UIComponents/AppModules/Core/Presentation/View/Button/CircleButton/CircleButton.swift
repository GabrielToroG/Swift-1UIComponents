//
//  CircleButton.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 03-06-23.
//

import UIKit

class CircleButton: UIView {
    private enum Constants {
        enum View {
            enum Container {
                static let color: UIColor = .brownColor
                static let cornerRadius: CGFloat = UiConstants.SMALL_RADIUS_BUTTON
                static let topAnchor: CGFloat = UiConstants.NO_SPACE
                static let bottomAnchor: CGFloat = UiConstants.NO_SPACE
                static let heightAnchor: CGFloat = UiConstants.SMALL_SIZE_BUTTON
                static let widthAnchor: CGFloat = UiConstants.SMALL_SIZE_BUTTON
            }
        }
        enum Button {
            enum Circle {
                static let topAnchor: CGFloat = UiConstants.TINY_SPACE
                static let leadingAnchor: CGFloat = UiConstants.TINY_SPACE
                static let trailingAnchor: CGFloat = -UiConstants.TINY_SPACE
                static let bottomAnchor: CGFloat = -UiConstants.TINY_SPACE
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
    private lazy var circleButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Config
    var item: CircleButtonArgs? {
        didSet {
            guard let item = item else { return }
            containerView.backgroundColor = item.backgroundColor
            circleButton.setImage(item.image, for: .normal)
            circleButton.tintColor = item.imageColor
        }
    }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        awakeFromNib()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        configUI()
    }

    // MARK: - UI Functions
    func configUI() {
        configConstraints()
    }

    private func configConstraints() {
        addSubview(containerView)
        containerView.addSubview(circleButton)

        let containerViewConstraints = [
            containerView.centerXAnchor.constraint(
                equalTo: centerXAnchor),
            containerView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Constants.View.Container.topAnchor),
            containerView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Constants.View.Container.bottomAnchor),
            containerView.widthAnchor.constraint(
                equalToConstant: Constants.View.Container.widthAnchor),
            containerView.heightAnchor.constraint(
                equalToConstant: Constants.View.Container.heightAnchor)
        ]
        let circleButtonConstraints = [
            circleButton.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: Constants.Button.Circle.topAnchor),
            circleButton.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Constants.Button.Circle.leadingAnchor),
            circleButton.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: Constants.Button.Circle.trailingAnchor),
            circleButton.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: Constants.Button.Circle.bottomAnchor),
        ]

        NSLayoutConstraint.activate(
            containerViewConstraints +
            circleButtonConstraints
        )
    }
}
