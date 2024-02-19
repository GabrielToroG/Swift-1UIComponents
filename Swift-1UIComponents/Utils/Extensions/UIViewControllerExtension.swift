//
//  UIViewControllerExtension.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-02-24.
//

import UIKit

extension UIViewController {
    /// Función que fija el título de navegación y el color de fondo de un UIViewController
    func configBasic(
        _ title: String = "",
        _ backgroundColor: UIColor
    ) {
        self.title = title
        self.view.backgroundColor = backgroundColor
    }
}
