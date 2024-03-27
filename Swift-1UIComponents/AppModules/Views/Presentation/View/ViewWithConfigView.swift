//
//  ViewWithConfigView.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 05-03-24.
//

import UIKit

final class ViewWithConfigView: UIView {

    private enum Constants {
        static let huggingPriority: UILayoutPriority = .init(rawValue: 251)
    }
    // Outlets
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var iconContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setContentHuggingPriority(Constants.huggingPriority, for: .horizontal)
        imageView.setContentHuggingPriority(Constants.huggingPriority, for: .vertical)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body.body1
        label.textColor = Asset.Colors.blackColor.color
        label.numberOfLines = Dimensions.Label.lines.one
        label.setContentHuggingPriority(Constants.huggingPriority, for: .horizontal)
        label.setContentHuggingPriority(Constants.huggingPriority, for: .vertical)
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
        containerView.addSubview(containerStackView)
        containerStackView.addArrangedSubview(iconContainerView)
        iconContainerView.addSubview(iconImageView)
        containerStackView.addArrangedSubview(titleLabel)

        let containerViewConstraints = [
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: Dimensions.View.normalSize)
        ]

        let containerStackViewConstraints = [
            containerStackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            containerStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        ]
        let iconContainerViewConstraints = [
            iconContainerView.widthAnchor.constraint(equalToConstant: Dimensions.Icon.normalSize),
        ]
        let iconImageViewConstraints = [
            iconImageView.centerYAnchor.constraint(equalTo: iconContainerView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: Dimensions.Icon.normalSize),
            iconImageView.heightAnchor.constraint(equalToConstant: Dimensions.Icon.normalSize),
            iconImageView.centerXAnchor.constraint(equalTo: iconContainerView.centerXAnchor)
        ]

        NSLayoutConstraint.activate(
            containerViewConstraints +
            containerStackViewConstraints +
            iconContainerViewConstraints +
            iconImageViewConstraints
        )

        // Establecer las prioridades de compresión y resistencia de contenido del UIStackView y sus subvistas
        containerStackView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        containerStackView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        iconContainerView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        iconContainerView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }


}
