//
//  HomeTableViewCell.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-05-23.
//

import UIKit


class HomeTableViewCell: UITableViewCell {
    private enum Constants {
        enum View {
            enum Container {
                static let color: UIColor = .brandColor
            }
        }
        enum ImageView {
            enum Option {
                static let color: UIColor = .blackColor
            }
        }
        enum Label {
            enum Option {
                static let font: UIFont = .montserratRegular16
                static let textColor: UIColor = .blackColor
            }
        }
    }

    // MARK: - Outlets
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.View.Container.color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var optionImageView: UIImageView = {
        let imageView = UIImageView()
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

    // MARK: - Properties
    var item: UiHomeOption? {
        didSet {
            guard let item = item else { return }
            optionImageView.image = UIImage(named: item.icon)
            optionLabel.text = item.title.localized()
        }
    }

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configUI()
    }

    // MARK: - UI Functions
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
                constant: UiConstants.NORMAL_SPACE),
            optionImageView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: UiConstants.NORMAL_SPACE),
            optionImageView.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: -UiConstants.NORMAL_SPACE),
            optionImageView.widthAnchor.constraint(
                equalToConstant: UiConstants.NORMAL_ICON_SIZE),
            optionImageView.heightAnchor.constraint(
                equalToConstant: UiConstants.NORMAL_ICON_SIZE)
        ]
        let optionLabelConstraints = [
            optionLabel.centerYAnchor.constraint(
                equalTo: optionImageView.centerYAnchor),
            optionLabel.leadingAnchor.constraint(
                equalTo: optionImageView.trailingAnchor,
                constant: UiConstants.NORMAL_SPACE),
            optionLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -UiConstants.NORMAL_SPACE)
        ]

        NSLayoutConstraint.activate(
            containerViewConstraints +
            optionImageViewConstraints +
            optionLabelConstraints
        )
    }
}
