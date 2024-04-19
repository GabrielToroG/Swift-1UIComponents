//
//  StickyTableViewHeader.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 01-04-24.
//

import UIKit

final class StickyTableViewHeader: UITableViewHeaderFooterView, Reusable {

    private enum Constants {
        static let actionWidthAnchor: CGFloat = 54
    }

    // Outlets
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body.body1
        label.textColor = Asset.Colors.blackColor.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var actionButton: UIButton = {
        let button = UIButton(type: .custom)
        button.titleLabel?.font = Fonts.Body.body1
        button.setTitleColor(.blackColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .brownColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // Init from code
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configUI()
    }

    // Init from XIB
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configUI()
    }
}

// MARK: - Configure
extension StickyTableViewHeader {
    func configure(
        title: String,
        showRightButton: Bool = false,
        rightButtonTitle: String? = nil,
        onRightAction: (() -> Void)? = nil
    ) {
        titleLabel.text = title
        actionButton.isHidden = !showRightButton
        actionButton.setTitle(rightButtonTitle, for: .normal)
        actionButton.onClick {
            onRightAction?()
        }
    }
}

// MARK: - UI Functions
extension StickyTableViewHeader {
    private func configUI() {
        contentView.backgroundColor = Asset.Colors.whiteColor.color
        configConstraints()
    }

    private func configConstraints() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(actionButton)
        contentView.addSubview(separatorView)

        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Dimensions.Margin.normal),
            titleLabel.centerYAnchor.constraint(
                equalTo: centerYAnchor)
        ]
        let actionButtonConstraints = [
            actionButton.leadingAnchor.constraint(
                equalTo: titleLabel.trailingAnchor,
                constant: Dimensions.Margin.normal),
            actionButton.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Dimensions.Margin.normal),
            actionButton.centerYAnchor.constraint(
                equalTo: contentView.centerYAnchor),
            actionButton.widthAnchor.constraint(
                equalToConstant: Constants.actionWidthAnchor)
        ]
        let separatorViewConstraints = [
            separatorView.widthAnchor.constraint(
                equalToConstant: Dimensions.Separator.underlineWidth),
            separatorView.heightAnchor.constraint(
                equalToConstant: Dimensions.Separator.bigHeight),
            separatorView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Dimensions.Margin.normal),
            separatorView.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor)
        ]

        NSLayoutConstraint.activate(
            titleLabelConstraints +
            actionButtonConstraints +
            separatorViewConstraints
        )
    }
}
