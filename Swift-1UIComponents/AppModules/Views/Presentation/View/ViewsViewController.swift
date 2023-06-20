//
//  ViewsViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 06-06-23.
//

import UIKit

class ViewsViewController: BaseViewController<ViewsViewModel> {
    private enum Constants {
        enum Base {
            enum General {
                static let title: String = "Views"
                static let color: UIColor = .brandColor
            }
        }
    }
    // MARK: - Properties
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = UiConstants.NORMAL_SPACE
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var shadowView: ViewWithShadow = {
        let view = ViewWithShadow()
        view.backgroundColor = .whiteColor
        view.data = .init(radius: 0, shadowOffset: CGSize(width: 0, height: 0))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    // MARK: - Outlets
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - UI Functions
    private func configUI() {
        configBasic(Constants.Base.General.title, Constants.Base.General.color)
        configConstraints()
    }
    private func configConstraints() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(shadowView)
        let mainStackViewConstraints = [
            mainStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: UiConstants.NORMAL_SPACE),
            mainStackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: UiConstants.NORMAL_SPACE),
            mainStackView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -UiConstants.NORMAL_SPACE)
        ]
        let shadowViewConstraints = [
            shadowView.heightAnchor.constraint(
                equalToConstant: UiConstants.NORMAL_VIEW_SIZE)
        ]

        NSLayoutConstraint.activate(mainStackViewConstraints + shadowViewConstraints)
    }
}
