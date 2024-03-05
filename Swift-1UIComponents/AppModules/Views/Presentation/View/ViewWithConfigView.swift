//
//  ViewWithConfigView.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 05-03-24.
//

import UIKit

final class ViewWithConfigView: UIView {

    // Outlets
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body.body2
        label.textColor = Asset.Colors.blackColor.color
        label.numberOfLines = Dimensions.Label.normalLines
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var iconImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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

    func config(
        backgroundColor: UIColor,
        titleText: String,
        image: UIImage,
        imageTintColor: UIColor
    ) {
        containerView.backgroundColor = backgroundColor
        titleLabel.text = titleText
        iconImageView.image = image
        iconImageView.tintColor = imageTintColor
    }
}

extension ViewWithConfigView {
    func configUI() {
        configConstraints()
    }
    
    private func configConstraints() {
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(iconImageView)

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
        let titleLabelConstraints = [
            titleLabel.centerYAnchor.constraint(
                equalTo: containerView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Dimensions.Margin.small),
            titleLabel.trailingAnchor.constraint(
                equalTo: iconImageView.leadingAnchor,
                constant: -Dimensions.Margin.small)
        ]
        let iconImageViewConstraints = [
            iconImageView.widthAnchor.constraint(
                equalToConstant: Dimensions.Icon.normalSize),
            iconImageView.heightAnchor.constraint(
                equalToConstant: Dimensions.Icon.normalSize),
            iconImageView.trailingAnchor.constraint(
                lessThanOrEqualTo: containerView.trailingAnchor,
                constant: -Dimensions.Margin.small),
            iconImageView.centerYAnchor.constraint(
                equalTo: titleLabel.centerYAnchor)
        ]

        NSLayoutConstraint.activate(
            containerViewConstraints +
            titleLabelConstraints +
            iconImageViewConstraints
        )
    }
}
