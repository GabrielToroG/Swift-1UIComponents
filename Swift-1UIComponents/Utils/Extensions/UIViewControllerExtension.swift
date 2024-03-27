//
//  UIViewControllerExtension.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-02-24.
//

import UIKit

extension UIViewController {
    /// Como usarlo:
    /// 1. Usarlo en el ConfigUI
    /// 2. En el configConstraints:
    ///     guard let scrollView = view.subviews.first else { return }
    ///     guard let contentView = scrollView.subviews.first else { return }
    ///     contentView.addSubviews()
    ///     darle las constraints necesarias top, leading, trailing, bottom
    func configScrollViewToView() {
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }

    /// Función que fija el título de navegación y el color de fondo de un UIViewController
    func configBasic(
        _ title: String = "",
        _ backgroundColor: UIColor
    ) {
        self.title = title
        self.view.backgroundColor = backgroundColor
    }
}
