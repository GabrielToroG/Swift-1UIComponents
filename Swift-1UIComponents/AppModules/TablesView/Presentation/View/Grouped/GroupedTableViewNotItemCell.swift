//
//  GroupedTableViewNotItemCell.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 22-06-23.
//

import UIKit

class GroupedTableViewNotItemCell: UITableViewCell {
    private enum Constants {
        enum View {
            enum Container {
                static let color: UIColor = .redColor
            }
        }
        enum Label {
            enum Option {
                static let font: UIFont = .montserratRegular16
                static let textColor: UIColor = .blackColor
            }
        }
    }
    
    // Outlets
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.View.Container.color
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var optionLabel: UILabel = {
        let label = UILabel()
        label.text = "ajaj"
        label.font = Constants.Label.Option.font
        label.textColor = Constants.Label.Option.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Properties
    var item: UiGroupedTableOption? {
        didSet {
            guard let item = item else { return }
            optionLabel.text = "Not \(item.title)"
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
private extension GroupedTableViewNotItemCell {
    private func configUI() {
        contentView.backgroundColor = .grayColor
        configConstraints()
    }
    private func configConstraints() {
        contentView.addSubview(containerView)
        containerView.addSubview(optionLabel)
        
        let containerViewConstraints = [
            containerView.topAnchor.constraint(
                equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -UiConstants.SMALL_SPACE)
        ]
        let optionLabelConstraints = [
            optionLabel.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: 8),
            optionLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: UiConstants.NORMAL_SPACE),
            optionLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -UiConstants.NORMAL_SPACE),
            optionLabel.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: -8)
        ]

        NSLayoutConstraint.activate(
            containerViewConstraints +
            optionLabelConstraints
        )
    }
}
