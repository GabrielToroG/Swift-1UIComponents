//
//  ViewWithActionView.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 04-03-24.
//

import UIKit

final class ViewWithActionView: UIView {

    // Outlets
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.onClick { [weak self] in
            self?.didTapImageView?()
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var actionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body.body1
        label.text = L10n.Views.alertText
        label.textColor = Asset.Colors.blackColor.color
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Properties
    var didTapImageView: (() -> Void)?

    // Init
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configUI()
    }
}

extension ViewWithActionView {
    func configUI() {
        configConstraints()
    }

    private func configConstraints() {
        addSubview(containerView)
        containerView.addSubview(actionLabel)

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
                equalToConstant: Dimensions.View.normalSize)
        ]
        let actionLabelConstraints = [
            actionLabel.centerYAnchor.constraint(
                equalTo: containerView.centerYAnchor),
            actionLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Dimensions.Margin.small),
            actionLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -Dimensions.Margin.small),
        ]

        NSLayoutConstraint.activate(
            containerViewConstraints +
            actionLabelConstraints
        )
    }
}
