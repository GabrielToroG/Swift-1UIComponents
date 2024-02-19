//
//  LabelViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-02-24.
//

import UIKit

final class LabelViewController: BaseViewController<LabelViewModel, LabelCoordinator> {
    // Outlets
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var strikethroughLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.Label.strikethrough
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var maxWidthLeftLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.Label.maxWidthLeft
        label.font = Fonts.Body.body1
        label.backgroundColor = .systemGray
        label.setContentHuggingPriority(Dimensions.Priorities.huggingPriority, for: .horizontal)
        label.setContentHuggingPriority(Dimensions.Priorities.huggingPriority, for: .vertical)
        label.setContentCompressionResistancePriority(Dimensions.Priorities.compressPriority, for: .horizontal)
        label.setContentCompressionResistancePriority(Dimensions.Priorities.compressPriority, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var maxWidthRightLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.Label.maxWidthRight
        label.font = Fonts.Body.body1
        label.backgroundColor = .systemYellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var differentStyleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body.body1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

// MARK: - Lifecycle
extension LabelViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configBindings()
        viewModel.onViewDidLoad()
    }
}

// MARK: - Bindings
extension LabelViewController {
    private func configBindings() {
        
    }
}

// MARK: - UI Functions
extension LabelViewController {
    private func configUI() {
        configBasic(L10n.Label.title, Asset.Colors.brandColor.color)
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
            NSAttributedString.Key.font: Fonts.Body.body1,
            NSAttributedString.Key.foregroundColor: UIColor.systemRed,
            NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.strokeWidth: Dimensions.Label.strokeWidth
        ]
        let attributedString = NSAttributedString(string: labelText, attributes: attributes)
        strikethroughLabel.attributedText = attributedString
    }

    func configDifferentStyles() {
        let firstText = (L10n.Label.differentStylesFirst).mutableAttribute
        firstText.set(foreground: .blackColor)
        firstText.set(font: Fonts.Body.body1)
        let secondText = (L10n.Label.differentStylesSecond).mutableAttribute
        secondText.set(foreground: .blackColor)
        secondText.set(font: Fonts.Body.body2)
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
                constant: Dimensions.Margin.normal),
            strikethroughLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Dimensions.Margin.normal),
            strikethroughLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -Dimensions.Margin.normal)
        ]
        let maxWidthLeftLabelConstraints = [
            maxWidthLeftLabel.topAnchor.constraint(
                equalTo: strikethroughLabel.bottomAnchor,
                constant: Dimensions.Margin.normal),
            maxWidthLeftLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Dimensions.Margin.normal),
            maxWidthLeftLabel.widthAnchor.constraint(
                lessThanOrEqualToConstant: Dimensions.Label.maxWidth)
        ]
        let maxWidthRightLabelConstraints = [
            maxWidthRightLabel.centerYAnchor.constraint(
                equalTo: maxWidthLeftLabel.centerYAnchor),
            maxWidthRightLabel.leadingAnchor.constraint(
                equalTo: maxWidthLeftLabel.trailingAnchor,
                constant: Dimensions.Margin.normal),
            maxWidthRightLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -Dimensions.Margin.normal)
        ]
        let differentStyleLabelConstraints = [
            differentStyleLabel.topAnchor.constraint(
                equalTo: maxWidthLeftLabel.bottomAnchor,
                constant: Dimensions.Margin.normal),
            differentStyleLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Dimensions.Margin.normal),
            differentStyleLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: Dimensions.Margin.normal)
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
