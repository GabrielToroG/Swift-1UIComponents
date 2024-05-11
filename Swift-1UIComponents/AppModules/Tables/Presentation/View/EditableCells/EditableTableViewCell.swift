//
//  EditableTableViewCell.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 10-05-24.
//

import UIKit

struct UIEditModeProduct {
    let product: String
    let description: String
    let price: String
}

// MARK: - Class
final class EditableTableViewCell: UITableViewCell, Reusable {
    private enum Constants {
        enum Label {
            enum ProductPrice {

            }
        }
    }

    // Outlets
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = .zero
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    lazy var leftContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var rightContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .whiteColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var checkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.General.uncheck.image
        imageView.tintColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body.body4
        label.textColor = Asset.Colors.blackColor.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = Dimensions.Label.lines.two
        label.font = Fonts.Body.body3
        label.textColor = Asset.Colors.blackColor.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body.body4
        label.textColor = Asset.Colors.blackColor.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Properties
    var firstConstraints: NSLayoutConstraint?
    var secondConstraints: NSLayoutConstraint?

    // Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configUI()
    }

    // Override
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(false, animated: animated)
        UIView.animate(withDuration: Dimensions.Animation.normalTiming) { [weak self] in
            guard let self = self else { return }
            if editing {
                self.firstConstraints?.isActive = false
                self.secondConstraints?.isActive = true
            } else {
                self.firstConstraints?.isActive = true
                self.secondConstraints?.isActive = false
            }
            self.layoutIfNeeded()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        checkImageView.image = selected 
            ? Asset.General.check.image
            : Asset.General.uncheck.image
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        checkImageView.image = isSelected 
            ? Asset.General.check.image
            : Asset.General.uncheck.image
    }
}

// MARK: - Config
extension EditableTableViewCell {
    func config(item: UIEditModeCell) {
        firstConstraints?.isActive = true
        secondConstraints?.isActive = false
        productNameLabel.text = item.product
        productDescriptionLabel.text = item.description
        productPriceLabel.text = item.price
    }
}

// MARK: - UI Functions
extension EditableTableViewCell {
    private func configUI() {
        backgroundColor = .clear
        configConstraints()
    }

    private func configConstraints() {
        contentView.addSubview(containerStackView)
        containerStackView.addArrangedSubview(leftContainerView)
        containerStackView.addArrangedSubview(rightContainerView)
        leftContainerView.addSubview(checkImageView)
        rightContainerView.addSubview(productImageView)
        rightContainerView.addSubview(productNameLabel)
        rightContainerView.addSubview(productDescriptionLabel)
        rightContainerView.addSubview(productPriceLabel)

        firstConstraints = containerStackView.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: -Dimensions.Margin.large)
        secondConstraints = containerStackView.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: .zero)

        let containerStackViewConstraints = [
            containerStackView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Dimensions.Margin.tiny),
            containerStackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),
            containerStackView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -Dimensions.Margin.tiny)
        ]
        let leftContainerViewConstraints = [
            leftContainerView.widthAnchor.constraint(
                equalToConstant: Dimensions.TableView.leftView.normalWidth),
            leftContainerView.heightAnchor.constraint(
                equalToConstant: Dimensions.View.mediumSize)
        ]
        let rightContainerViewConstraints = [
            rightContainerView.heightAnchor.constraint(
                equalToConstant: Dimensions.View.mediumSize),
        ]
        let checkImageViewConstraints = [
            checkImageView.widthAnchor.constraint(
                equalToConstant: Dimensions.Icon.smallSize),
            checkImageView.heightAnchor.constraint(
                equalToConstant: Dimensions.Icon.smallSize),
            checkImageView.centerXAnchor.constraint(
                equalTo: leftContainerView.centerXAnchor),
            checkImageView.centerYAnchor.constraint(
                equalTo: leftContainerView.centerYAnchor)
        ]
        let productImageViewConstraints = [
            productImageView.centerYAnchor.constraint(
                equalTo: rightContainerView.centerYAnchor),
            productImageView.leadingAnchor.constraint(
                equalTo: rightContainerView.leadingAnchor,
                constant: Dimensions.Margin.small),
            productImageView.widthAnchor.constraint(
                equalToConstant: Dimensions.Images.tinySize),
            productImageView.heightAnchor.constraint(
                equalToConstant: Dimensions.Images.tinySize)
        ]
        let productNameLabelConstraints = [
            productNameLabel.topAnchor.constraint(
                equalTo: rightContainerView.topAnchor,
                constant: Dimensions.Margin.small),
            productNameLabel.leadingAnchor.constraint(
                equalTo: productImageView.trailingAnchor,
                constant: Dimensions.Margin.small),
            productNameLabel.widthAnchor.constraint(
                equalToConstant: Dimensions.Label.Width.large)
        ]
        let productDescriptionLabelConstraints = [
            productDescriptionLabel.topAnchor.constraint(
                equalTo: productNameLabel.bottomAnchor),
            productDescriptionLabel.leadingAnchor.constraint(
                equalTo: productImageView.trailingAnchor,
                constant: Dimensions.Margin.small),
            productDescriptionLabel.trailingAnchor.constraint(
                equalTo: rightContainerView.trailingAnchor,
                constant: -Dimensions.Margin.small)
        ]
        let productPriceLabelConstraints = [
            productPriceLabel.topAnchor.constraint(
                greaterThanOrEqualTo: productDescriptionLabel.bottomAnchor),
            productPriceLabel.bottomAnchor.constraint(
                equalTo: rightContainerView.bottomAnchor,
                constant: -Dimensions.Margin.small),
            productPriceLabel.leadingAnchor.constraint(
                equalTo: productImageView.trailingAnchor,
                constant: Dimensions.Margin.small),
            productPriceLabel.trailingAnchor.constraint(
                equalTo: rightContainerView.trailingAnchor,
                constant: -Dimensions.Margin.small),
        ]

        NSLayoutConstraint.activate(
            containerStackViewConstraints +
            leftContainerViewConstraints +
            rightContainerViewConstraints +
            checkImageViewConstraints +
            productImageViewConstraints +
            productDescriptionLabelConstraints +
            productNameLabelConstraints +
            productPriceLabelConstraints
        )
    }
}
