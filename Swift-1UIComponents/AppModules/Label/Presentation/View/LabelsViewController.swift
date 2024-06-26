//
//  LabelsViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-02-24.
//

import UIKit
import Combine

final class LabelsViewController: BaseViewController<LabelsViewModel, LabelsCoordinator> {
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
    private lazy var reactiveMapLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body.body1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var reactiveFilterLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body.body1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var reactiveCompactMapLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body.body1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

// MARK: - Lifecycle
extension LabelsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configBindings()
        viewModel.onViewDidLoad()
    }
}


// MARK: - UI Functions
extension LabelsViewController {
    private func configBindings() {
        viewModel.$numbers
            .map { number in
                number.map { "\($0 * 2)" }.joined(separator: ", ")
            }
            .assign(to: \.text, on: reactiveMapLabel)
            .store(in: &anyCancellable)

        viewModel.$numbers
            .map { number in
                number.filter { $0 % 2 == 0 }.map { "\($0)" }.joined(separator: ", ")
            }
            .assign(to: \.text, on: reactiveFilterLabel)
            .store(in: &anyCancellable)

        viewModel.$numbers
            .map { numbers in
                numbers.compactMap { $0 % 3 == 0 ? "\($0)" : nil }.joined(separator: ", ")
            }
            .assign(to: \.text, on: reactiveCompactMapLabel)
            .store(in: &anyCancellable)
    }
    private func configUI() {
        configBasic(L10n.Label.title, Asset.Colors.brandColor.color)
        configLabels()
        configConstraints()
        let backButton = UIBarButtonItem()
         backButton.title = "Regresar" // Cambia el texto del botón aquí
         navigationItem.backBarButtonItem = backButton
    }

    private func configLabels() {
        configStroke()
        configDifferentStyles()
    }

    private func configStroke() {
        guard let labelText = strikethroughLabel.text else { return }
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: Fonts.Body.body1,
            NSAttributedString.Key.foregroundColor: UIColor.systemRed,
            NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.strokeWidth: Dimensions.Label.Stroke.normalWidth
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
        secondText.set(font: Fonts.Body.body3)
        firstText.append(secondText)
        differentStyleLabel.attributedText = firstText
    }
    
    private func configConstraints() {
        view.addSubview(containerView)
        containerView.addSubview(strikethroughLabel)
        containerView.addSubview(maxWidthLeftLabel)
        containerView.addSubview(maxWidthRightLabel)
        containerView.addSubview(differentStyleLabel)
        containerView.addSubview(reactiveMapLabel)
        containerView.addSubview(reactiveFilterLabel)
        containerView.addSubview(reactiveCompactMapLabel)

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
                lessThanOrEqualToConstant: Dimensions.Label.Width.large)
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
        let reactiveMapLabelConstraints = [
            reactiveMapLabel.topAnchor.constraint(
                equalTo: differentStyleLabel.bottomAnchor,
                constant: Dimensions.Margin.normal),
            reactiveMapLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Dimensions.Margin.normal),
            reactiveMapLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: Dimensions.Margin.normal)
        ]
        let reactiveFilterLabelConstraints = [
            reactiveFilterLabel.topAnchor.constraint(
                equalTo: reactiveMapLabel.bottomAnchor,
                constant: Dimensions.Margin.normal),
            reactiveFilterLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Dimensions.Margin.normal),
            reactiveFilterLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: Dimensions.Margin.normal)
        ]
        let reactiveCompactMapLabelConstraints = [
            reactiveCompactMapLabel.topAnchor.constraint(
                equalTo: reactiveFilterLabel.bottomAnchor,
                constant: Dimensions.Margin.normal),
            reactiveCompactMapLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Dimensions.Margin.normal),
            reactiveCompactMapLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: Dimensions.Margin.normal)
        ]

        NSLayoutConstraint.activate(
            containerViewContraints +
            strikethroughLabelConstraints +
            maxWidthLeftLabelConstraints +
            maxWidthRightLabelConstraints +
            differentStyleLabelConstraints +
            reactiveMapLabelConstraints +
            reactiveFilterLabelConstraints +
            reactiveCompactMapLabelConstraints
        )
    }
}
