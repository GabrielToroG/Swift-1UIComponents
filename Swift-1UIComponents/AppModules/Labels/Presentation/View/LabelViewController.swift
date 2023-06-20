//
//  LabelsViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 10-05-23.
//

import UIKit

class LabelsViewController: BaseViewController<LabelsViewModel> {
    private enum Constants {
        enum Base {
            enum General {
                static let text: String = "label.title".localized()
                static let color: UIColor = .brandColor
            }
        }
        enum Label {
            enum Strikethrough {
                static let text: String = "label.strikethrough".localized()
                static let font: UIFont = .montserratRegular18
                static let color: UIColor = .systemRed
            }
            enum MaxWidthLeft {
                static let huggingPriority: UILayoutPriority = .init(rawValue: 252)
                static let compressPriority: UILayoutPriority = .init(rawValue: 752)
                static let text: String = "label.max.width.left".localized()
                static let font: UIFont = .montserratRegular18
                static let backgroundColor: UIColor = .systemGray
            }
            enum MaxWidthRight {
                static let text: String = "label.max.width.right".localized()
                static let font: UIFont = .montserratRegular18
                static let backgroundColor: UIColor = .systemYellow
            }
            enum DifferentStyles {
                static let font: UIFont = .montserratRegular18
            }
        }
    }

    // MARK: - Properties
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var strikethroughLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Label.Strikethrough.text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var maxWidthLeftLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Label.MaxWidthLeft.text
        label.font = Constants.Label.MaxWidthLeft.font
        label.backgroundColor = Constants.Label.MaxWidthLeft.backgroundColor
        label.setContentHuggingPriority(Constants.Label.MaxWidthLeft.huggingPriority, for: .horizontal)
        label.setContentHuggingPriority(Constants.Label.MaxWidthLeft.huggingPriority, for: .vertical)
        label.setContentCompressionResistancePriority(Constants.Label.MaxWidthLeft.compressPriority, for: .horizontal)
        label.setContentCompressionResistancePriority(Constants.Label.MaxWidthLeft.compressPriority, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var maxWidthRightLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Label.MaxWidthRight.text
        label.font = Constants.Label.MaxWidthRight.font
        label.backgroundColor = Constants.Label.MaxWidthRight.backgroundColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var differentStyleLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Label.DifferentStyles.font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

    // MARK: - UI Functions
    private func configUI() {
        configBasic(Constants.Base.General.text, Constants.Base.General.color)
        configLabels()
        configConstraints()
    }

    private func configLabels() {
        configDifferentStyles()
        configStroke()
    }

    private func configStroke() {
        guard let labelText = strikethroughLabel.text else { return }
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: Constants.Label.Strikethrough.font,
            NSAttributedString.Key.foregroundColor: Constants.Label.Strikethrough.color,
            NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.strokeWidth: -2.0
        ]
        let attributedString = NSAttributedString(string: labelText, attributes: attributes)
        strikethroughLabel.attributedText = attributedString
    }

    func configDifferentStyles() {
        let firstText = ("label.different.styles.first".localized()).mutableAttribute
        firstText.set(foreground: .blackColor)
        firstText.set(font: .montserratSemibold18)
        let secondText = ("label.different.styles.second".localized()).mutableAttribute
        secondText.set(foreground: .blackColor)
        secondText.set(font: .montserratRegular14)
        firstText.append(secondText)
        differentStyleLabel.attributedText = firstText
    }

    private func configConstraints() {
        view.addSubview(containerView)
        containerView.addSubview(strikethroughLabel)
        containerView.addSubview(maxWidthLeftLabel)
        containerView.addSubview(maxWidthRightLabel)
        containerView.addSubview(differentStyleLabel)

        let containerViewContraints = [
            containerView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        let strikethroughLabelConstraints = [
            strikethroughLabel.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: UiConstants.NORMAL_SPACE),
            strikethroughLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: UiConstants.NORMAL_SPACE),
            strikethroughLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -UiConstants.NORMAL_SPACE)
        ]
        let maxWidthLeftLabelConstraints = [
            maxWidthLeftLabel.topAnchor.constraint(
                equalTo: strikethroughLabel.bottomAnchor,
                constant: UiConstants.NORMAL_SPACE),
            maxWidthLeftLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: UiConstants.NORMAL_SPACE),
            maxWidthLeftLabel.widthAnchor.constraint(
                lessThanOrEqualToConstant: UiConstants.MAX_WIDTH_LABEL)
        ]
        let maxWidthRightLabelConstraints = [
            maxWidthRightLabel.centerYAnchor.constraint(
                equalTo: maxWidthLeftLabel.centerYAnchor),
            maxWidthRightLabel.leadingAnchor.constraint(
                equalTo: maxWidthLeftLabel.trailingAnchor,
                constant: UiConstants.NORMAL_SPACE),
            maxWidthRightLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -UiConstants.NORMAL_SPACE)
        ]
        let differentStyleLabelConstraints = [
            differentStyleLabel.topAnchor.constraint(
                equalTo: maxWidthLeftLabel.bottomAnchor,
                constant: UiConstants.NORMAL_SPACE),
            differentStyleLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: UiConstants.NORMAL_SPACE),
            differentStyleLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: UiConstants.NORMAL_SPACE)
        ]

        NSLayoutConstraint.activate(
            containerViewContraints +
            strikethroughLabelConstraints +
            maxWidthLeftLabelConstraints +
            maxWidthRightLabelConstraints +
            differentStyleLabelConstraints
        )
    }
}
