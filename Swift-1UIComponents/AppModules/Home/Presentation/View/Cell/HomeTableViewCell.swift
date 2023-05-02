//
//  HomeTableViewCell.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-05-23.
//

import UIKit

struct UiHomeOption {
    let icon: String
    let title: String
}

class HomeTableViewCell: UITableViewCell {

    // MARK: - Outlets
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var optionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .label
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var optionLabel: UILabel = {
        let label = UILabel()
        label.text = "Opcion 1"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: - Properties
    var item: UiHomeOption? {
        didSet {
            guard let item = item else { return }
            optionImageView.image = UIImage(named: item.icon)
            optionLabel.text = item.title
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
            optionImageView.widthAnchor.constraint(
                equalToConstant: 30),
            optionImageView.heightAnchor.constraint(
                equalToConstant: 30),
            optionImageView.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: UiConstants.normalMargin),
            optionImageView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: UiConstants.normalMargin),
            optionImageView.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: -UiConstants.normalMargin)
        ]
        let optionLabelConstraints = [
            optionLabel.centerYAnchor.constraint(
                equalTo: optionImageView.centerYAnchor),
            optionLabel.leadingAnchor.constraint(
                equalTo: optionImageView.trailingAnchor,
                constant: UiConstants.normalMargin),
            optionLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -UiConstants.normalMargin)
        ]
        
        NSLayoutConstraint.activate(
            containerViewConstraints +
            optionImageViewConstraints +
            optionLabelConstraints
        )
    }
}
