//
//  ReactiveInfoSectionView.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 08-05-24.
//

import UIKit

final class ReactiveInfoSectionView: UIView {

    // Outlet
    private lazy var colorContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Config
extension ReactiveInfoSectionView {
    func config(
        _ data: [UIReactiveInformationArgs],
        _ indexSelected: Int
    ) {
        if let item = data.first(where: {$0.id == indexSelected}) {
            colorContainerView.backgroundColor = item.backgroundColor
        }
    }
}

//MARK: - UI
extension ReactiveInfoSectionView {
    func configUI() {
        configConstraints()
    }

    func configConstraints() {
        addSubview(colorContainerView)
        let colorContainerViewConstraints = [
            colorContainerView.topAnchor.constraint(equalTo: topAnchor),
            colorContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            colorContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            colorContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            colorContainerView.heightAnchor.constraint(equalToConstant: Dimensions.TableView.Cell.normalHeight)
        ]
        NSLayoutConstraint.activate(colorContainerViewConstraints)
    }
}
