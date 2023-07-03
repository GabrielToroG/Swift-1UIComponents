//
//  ScrollableView.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 26-05-23.
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

    /// Función para configurar el titulo, color y fuente de la navegación
    func configNavigationHeader(
        title: String = "",
        titleColor: UIColor = UIColor.whiteColor,
        titleFont: UIFont = UIFont.montserratRegular17
    ) {
        self.title = title // Set title of navigation
        let standardAppearance = UINavigationBarAppearance()
        
        // config Title text
        standardAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: titleColor,
            NSAttributedString.Key.font: titleFont
        ]
        // prevent Nav Bar color change on scroll view push behind NavBar
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundColor = UIColor.clear

        self.navigationController?.navigationBar.standardAppearance = standardAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = standardAppearance
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
