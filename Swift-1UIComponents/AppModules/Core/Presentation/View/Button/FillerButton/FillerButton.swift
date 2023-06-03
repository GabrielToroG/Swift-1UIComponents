//
//  FillerButton.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 27-05-23.
//

import UIKit

class FillerButton: UIView {
    private enum Constants {
        enum Button {
            enum Filler {
                static let radius: CGFloat = UiConstants.bigSpace
                static let font: UIFont = .montserratSemibold17
                static let heightAnchor: CGFloat = UiConstants.bigSpace*2
            }
        }
    }

    // MARK: - Outlets
    private lazy var containerView: UIButton = {
        let view = UIButton(type: .system)
        view.layer.cornerRadius = Constants.Button.Filler.radius
        view.titleLabel?.font = Constants.Button.Filler.font
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Config
    var item: FillerButtonArgs? {
        didSet {
            guard let item = item else { return }
            containerView.setTitle(item.title, for: .normal)
            containerView.setTitleColor(item.titleColor, for: .normal)
            containerView.backgroundColor = item.backgroundColor
        }
    }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        awakeFromNib()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    // MARK: - UI Functions
    func setupUI() {
        configConstraints()
    }

    private func configConstraints() {
        addSubview(containerView)

        let containerViewConstraints = [
            containerView.topAnchor.constraint(
                equalTo: topAnchor),
            containerView.leadingAnchor.constraint(
                equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(
                equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(
                equalTo: bottomAnchor),
            containerView.heightAnchor.constraint(
                equalToConstant: Constants.Button.Filler.heightAnchor)
        ]

        NSLayoutConstraint.activate(
            containerViewConstraints
        )
    }
}
