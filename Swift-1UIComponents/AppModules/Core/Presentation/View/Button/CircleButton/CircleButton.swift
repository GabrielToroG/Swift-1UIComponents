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
                static let heightAnchor: CGFloat = 300
            }
        }
    }

    // MARK: - Outlets
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .brownColor
        view.layer.cornerRadius = UiConstants.bigSpace
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
        setupUI()
    }

    // MARK: - UI Functions
    func setupUI() {
        configConstraints()
    }

    private func configConstraints() {
        addSubview(containerView)
        containerView.addSubview(circleButton)

        let containerViewConstraints = [
            containerView.topAnchor.constraint(
                equalTo: topAnchor),
            containerView.bottomAnchor.constraint(
                equalTo: bottomAnchor),
            containerView.centerXAnchor.constraint(
                equalTo: centerXAnchor),
            containerView.widthAnchor.constraint(
                equalToConstant: UiConstants.superXLSpace),
            containerView.heightAnchor.constraint(
                equalToConstant: UiConstants.superXLSpace)
        ]
        let circleButtonConstraints = [
            circleButton.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: UiConstants.tinySpace),
            circleButton.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: UiConstants.tinySpace),
            circleButton.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -UiConstants.tinySpace),
            circleButton.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: -UiConstants.tinySpace),
        ]

        NSLayoutConstraint.activate(
            containerViewConstraints +
            circleButtonConstraints
        )
    }
}
