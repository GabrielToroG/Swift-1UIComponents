//
//  ScrollableHeaderTableViewCell.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-04-24.
//

import UIKit

// MARK: - Class
final class ScrollableHeaderTableViewCell: UITableViewCell {
    private enum Constants {
        enum View {
            enum Container {
                static let color: UIColor = .brownColor
            }
        }
        enum ImageView {
            enum Option {
                static let color: UIColor = .blackColor
            }
        }
        enum Label {
            enum Option {
                static let font: UIFont = Fonts.Body.body2
                static let textColor: UIColor = .blackColor
            }
        }
    }

    // Outlets
    private lazy var containerView: ViewWithShadow = {
        let view = ViewWithShadow()
        view.backgroundColor = Constants.View.Container.color
        view.config(ViewWithShadowArgs())
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var optionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house")
        imageView.tintColor = Constants.ImageView.Option.color
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var optionLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Label.Option.font
        label.textColor = Constants.Label.Option.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Config
    var item: UIScrollableHeader? {
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
extension ScrollableHeaderTableViewCell {
    private func configUI() {
        backgroundColor = .clear
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
