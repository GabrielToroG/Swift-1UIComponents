//
//  ExpandableTableViewCell.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 12-05-24.
//

import UIKit

final class ExpandableTableViewCell: UITableViewCell, Reusable {
    private enum Constants {
        static let greenBGColor: UIColor = .systemGreen
        static let greenBGColorAlpha: UIColor = .systemGreen.withAlphaComponent(0.4)
        static let redBGColor: UIColor = .systemRed
        static let redBGColorAlpha: UIColor = .systemRed.withAlphaComponent(0.4)
    }

    // Outlets
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Dimensions.StackView.smallSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var topContainerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = Dimensions.StackView.smallSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var greenContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.greenBGColorAlpha
        view.onClick { [weak self] in
            guard let self = self else { return }
            self.didTapGreenView?()
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var redContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.redBGColorAlpha
        view.onClick { [weak self] in
            guard let self = self else { return }
            self.didTapRedView?()
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var bottomContainerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = Dimensions.StackView.smallSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var expandibleView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var expandibleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "pencil.circle")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var expandibleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body.body3
        label.textColor = Asset.Colors.blackColor.color
        label.numberOfLines = Dimensions.Label.lines.one
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Properties
    private var didTapGreenView: (() -> Void)?
    private var didTapRedView: (() -> Void)?

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

// MARK: - Config
extension ExpandableTableViewCell {
    func config(
        item: UIExpandableModeCell,
        didTapGreenView: (() -> Void)?,
        didTapRedView: (() -> Void)?
    ) {
        if item.leftViewActived || item.rightViewActived {
            expandibleView.isHidden = false
        } else {
            expandibleView.isHidden = true
        }

        if item.leftViewActived {
            expandibleLabel.text = item.leftViewTitle
            greenContainerView.backgroundColor = Constants.greenBGColor
        } else {
            greenContainerView.backgroundColor = Constants.greenBGColorAlpha
        }

        if item.rightViewActived {
            expandibleLabel.text = item.rightViewTitle
            redContainerView.backgroundColor = Constants.redBGColor
        } else {
            redContainerView.backgroundColor = Constants.redBGColorAlpha
        }

        self.didTapGreenView = didTapGreenView
        self.didTapRedView = didTapRedView
    }
}

// MARK: - UI Functions
extension ExpandableTableViewCell {
    private func configUI() {
        backgroundColor = .clear
        configConstraints()
    }

    private func configConstraints() {
        contentView.addSubview(containerStackView)
        containerStackView.addArrangedSubview(topContainerStackView)
        topContainerStackView.addArrangedSubview(greenContainerView)
        topContainerStackView.addArrangedSubview(redContainerView)

        containerStackView.addArrangedSubview(bottomContainerStackView)
        bottomContainerStackView.addArrangedSubview(expandibleView)
        expandibleView.addSubview(expandibleImageView)
        expandibleView.addSubview(expandibleLabel)

        let containerStackViewConstraints = [
            containerStackView.topAnchor.constraint(
                equalTo: contentView.topAnchor),
            containerStackView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Dimensions.Margin.small),
            containerStackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Dimensions.Margin.small),
            containerStackView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -Dimensions.Margin.medium)
        ]
        let topContainerStackViewConstraints = [
            topContainerStackView.heightAnchor.constraint(
                equalToConstant: Dimensions.View.smallSize)
        ]
        let bottomContainerStackViewConstraints = [
            bottomContainerStackView.heightAnchor.constraint(
                equalToConstant: Dimensions.View.smallSize)
        ]
        let expandibleViewConstraints = [
            expandibleView.topAnchor.constraint(
                equalTo: bottomContainerStackView.topAnchor),
            expandibleView.leadingAnchor.constraint(
                equalTo: bottomContainerStackView.leadingAnchor),
            expandibleView.trailingAnchor.constraint(
                equalTo: bottomContainerStackView.trailingAnchor),
            expandibleView.bottomAnchor.constraint(
                equalTo: bottomContainerStackView.bottomAnchor)
        ]
        let expandibleImageViewConstraints = [
            expandibleImageView.heightAnchor.constraint(
                equalToConstant: Dimensions.Icon.smallSize),
            expandibleImageView.widthAnchor.constraint(
                equalToConstant: Dimensions.Icon.smallSize),
            expandibleImageView.topAnchor.constraint(
                equalTo: expandibleView.topAnchor,
                constant: Dimensions.Margin.small),
            expandibleImageView.bottomAnchor.constraint(
                equalTo: expandibleView.bottomAnchor,
                constant: -Dimensions.Margin.small),
            expandibleImageView.leadingAnchor.constraint(
                equalTo: expandibleView.leadingAnchor,
                constant: Dimensions.Margin.normal)
        ]
        let expandibleLabelConstraints = [
            expandibleLabel.centerYAnchor.constraint(
                equalTo: expandibleImageView.centerYAnchor),
            expandibleLabel.leadingAnchor.constraint(
                equalTo: expandibleImageView.trailingAnchor,
                constant: Dimensions.Margin.small),
            expandibleLabel.trailingAnchor.constraint(
                equalTo: expandibleView.trailingAnchor,
                constant: -Dimensions.Margin.normal)
        ]

        NSLayoutConstraint.activate(
            containerStackViewConstraints +
            topContainerStackViewConstraints +
            bottomContainerStackViewConstraints +
            expandibleViewConstraints +
            expandibleImageViewConstraints +
            expandibleLabelConstraints
        )
    }
}
