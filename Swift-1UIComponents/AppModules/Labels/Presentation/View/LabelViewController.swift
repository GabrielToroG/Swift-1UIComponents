//
//  LabelsViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 10-05-23.
//

import UIKit

class LabelsViewController: BaseViewController<LabelsViewModel> {
    private enum Constants {
        
    }
    
    // MARK: - Properties
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var strikethroughLabel: UILabel = {
        let label = UILabel()
        label.text = "jajaj"
        label.font = .montserratRegular18
        label.backgroundColor = .systemRed
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Outlets

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        configUI()
    }
    
    // MARK: - UI Functions
    private func configUI() {
        configHeader()
        configConstraints()
    }
    private func configHeader() {
        title = "Labels"
    }
    private func configConstraints() {
        view.addSubview(containerView)
        containerView.addSubview(strikethroughLabel)
        let containerViewContraints = [
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        let strikethroughLabelConstraints = [
            strikethroughLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: UiConstants.normalMargin),
            strikethroughLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: UiConstants.normalMargin),
            strikethroughLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -UiConstants.normalMargin)
        ]
        NSLayoutConstraint.activate(containerViewContraints + strikethroughLabelConstraints)
    }
}
