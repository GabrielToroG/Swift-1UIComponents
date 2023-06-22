//
//  InsetGroupTableViewHeaderView.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 22-06-23.
//

import UIKit

// MARK: - Class
final class InsetGroupTableViewHeaderView: UIView {
    private enum Constants {
        enum View {
            enum Container {
                static let color: UIColor = .brownColor
                static let radius: CGFloat = 4
            }
        }
        enum Label {
            enum Title {
                static let font: UIFont = .montserratSemibold16
                static let color: UIColor = .blackColor
            }
        }
    }

    // Outlets
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.View.Container.radius
        view.backgroundColor = Constants.View.Container.color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Label.Title.font
        label.textColor = Constants.Label.Title.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Properties
    var count: Int? {
        didSet {
            guard let count = count else { return }
            titleLabel.text = "La cantidad es: \(count)"
        }
    }

    // Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        awakeFromNib()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        configUI()
    }
}

// MARK: - UI Functions
private extension InsetGroupTableViewHeaderView {
    private func configUI() {
        configConstraints()
    }

    private func configConstraints() {
        addSubview(containerView)
        containerView.addSubview(titleLabel)

        let containerViewConstraints = [
            containerView.topAnchor.constraint(
                equalTo: topAnchor),
            containerView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: UiConstants.NORMAL_SPACE),
            containerView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -UiConstants.NORMAL_SPACE),
            containerView.bottomAnchor.constraint(
                equalTo: bottomAnchor),
        ]
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: UiConstants.SMALL_SPACE),
            titleLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: UiConstants.NORMAL_SPACE),
            titleLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -UiConstants.SMALL_SPACE),
            titleLabel.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: -UiConstants.SMALL_SPACE),
        ]

        NSLayoutConstraint.activate(
            containerViewConstraints +
            titleLabelConstraints
        )
    }
}
