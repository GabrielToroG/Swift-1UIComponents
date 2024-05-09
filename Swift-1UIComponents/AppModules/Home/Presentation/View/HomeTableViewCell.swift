//
//  HomeTableViewCell.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-02-24.
//

import UIKit

class HomeTableViewCell: UITableViewCell, Reusable {

    // Outlets
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .brandColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var optionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .blackColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var optionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body.body1
        label.textColor = .blackColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Config
    var item: UiHomeOption? {
        didSet {
            guard let item = item else { return }
            optionImageView.image = item.icon
            optionLabel.text = item.title
        }
    }

    // Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configUI()
    }
}

// MARK: - UI Functions
extension HomeTableViewCell {
    private func configUI() {
        configConstraints()
    }
    private func configConstraints() {
        contentView.addSubview(containerView)
        containerView.addSubview(optionImageView)
        containerView.addSubview(optionLabel)

        let containerViewConstraints = [
            containerView.topAnchor.constraint(
                equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor)
        ]
        let optionImageViewConstraints = [
            optionImageView.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: Dimensions.Margin.small),
            optionImageView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Dimensions.Margin.normal),
            optionImageView.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: -Dimensions.Margin.small),
            optionImageView.widthAnchor.constraint(
                equalToConstant: Dimensions.Icon.normalSize),
            optionImageView.heightAnchor.constraint(
                equalToConstant: Dimensions.Icon.normalSize)
        ]
        let optionLabelConstraints = [
            optionLabel.centerYAnchor.constraint(
                equalTo: optionImageView.centerYAnchor),
            optionLabel.leadingAnchor.constraint(
                equalTo: optionImageView.trailingAnchor,
                constant: Dimensions.Margin.normal),
            optionLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -Dimensions.Margin.normal)
        ]

        NSLayoutConstraint.activate(
            containerViewConstraints +
            optionImageViewConstraints +
            optionLabelConstraints
        )
    }
}
