//
//  StickyHeadersTableViewCell.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 01-04-24.
//

import UIKit

final class StickyHeadersTableViewCell: UITableViewCell, Reusable {

    // Outlets
    private lazy var containerView: ViewWithShadow = {
        let view = ViewWithShadow()
        view.backgroundColor = Asset.Colors.brownColor.color
        view.config(ViewWithShadowArgs())
        view.layer.cornerRadius = Dimensions.BorderRadius.big
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var optionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house")
        imageView.tintColor = Asset.Colors.blackColor.color
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var optionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body.body2
        label.textColor = Asset.Colors.blackColor.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Config
    var item: UIStickyHeader? {
        didSet {
            guard let item = item else { return }
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
extension StickyHeadersTableViewCell {
    private func configUI() {
        backgroundColor = Asset.Colors.whiteColor.color
        configConstraints()
    }

    private func configConstraints() {
        contentView.addSubview(containerView)
        containerView.addSubview(optionImageView)
        containerView.addSubview(optionLabel)

        let containerViewConstraints = [
            containerView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Dimensions.Margin.small),
            containerView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, 
                constant: Dimensions.Margin.normal),
            containerView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, 
                constant: -Dimensions.Margin.normal),
            containerView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor, 
                constant: -Dimensions.Margin.small) // Distancia con la siguiente celda
        ]
        let optionImageViewConstraints = [
            optionImageView.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: Dimensions.Margin.normal),
            optionImageView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Dimensions.Margin.normal),
            optionImageView.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: -Dimensions.Margin.normal),
            optionImageView.widthAnchor.constraint(
                equalToConstant: Dimensions.Icon.bigSize),
            optionImageView.heightAnchor.constraint(
                equalToConstant: Dimensions.Icon.bigSize)
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
