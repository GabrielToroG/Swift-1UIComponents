//
//  ReactiveInfoSectionView.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 08-05-24.
//

import UIKit

final class ReactiveInfoSectionView: UIView {

    private lazy var colorContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var data: [UIReactiveInformationArgs] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func config(_ data: [UIReactiveInformationArgs]) {
        self.data = data
    }
}

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
            colorContainerView.heightAnchor.constraint(equalToConstant: Dimensions.TableView.Sections.normalheight)
        ]
        NSLayoutConstraint.activate(colorContainerViewConstraints)
    }
}
