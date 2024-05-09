//
//  ClickableCarouselCellView.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-04-24.
//

import UIKit

final class ClickableCarouselCellView: UIView {

    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Dimensions.BorderRadius.normal
        view.layer.borderWidth = Dimensions.BorderWidth.minimum
        view.layer.borderColor = UIColor.clear.cgColor
        view.backgroundColor = Asset.Colors.whiteColor.color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body.body1SemiBold
        label.textColor = Asset.Colors.grayColor.color
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var data: [String] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func config(data: UIClickableCarouselSectionArgs) {
        titleLabel.text = data.title

        containerView.onClick {
            data.onSelectedOption?()
        }

        if let state = data.stateSelected, state {
            changeBorderColor()
        } else {
            removeBorderColor()
        }
    }
}

extension ClickableCarouselCellView {
    func configUI() {
        configConstraints()
    }

    func configConstraints() {
        addSubview(containerView)
        containerView.addSubview(titleLabel)

        let containerViewConstraints = [
            containerView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Dimensions.Margin.normal),
            containerView.leadingAnchor.constraint(
                equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(
                equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -Dimensions.Margin.normal),
        ]
        let titleLabelConstraints = [
            titleLabel.centerYAnchor.constraint(
                equalTo: containerView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Dimensions.Margin.small),
            titleLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -Dimensions.Margin.small)
        ]

        NSLayoutConstraint.activate(
            containerViewConstraints +
            titleLabelConstraints
        )
    }

    private func changeBorderColor() {
        containerView.layer.borderColor = Asset.Colors.brownColor.color.cgColor
        titleLabel.textColor = Asset.Colors.brownColor.color
    }

    private func removeBorderColor() {
        containerView.layer.borderColor = Asset.Colors.darkGreyColor.color.cgColor
        titleLabel.textColor = Asset.Colors.darkGreyColor.color
    }
}
