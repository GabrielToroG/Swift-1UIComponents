//
//  UITableViewExtension.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-02-24.
//

import UIKit

extension UITableView {
    /// Función para registrar la celda programática más rápido
    func registerCellClass<T: UITableViewCell>(
        _ type: T.Type
    ) where T: Reusable {
        register(type.self, forCellReuseIdentifier: T.identifier)
    }

    /// Función para inicializar la celda en cellForRowAt
    func dequeueReusableCell<T>(
        forType type: T.Type,
        at indexPath: IndexPath
    ) -> T? where T: UITableViewCell {
        let identifier = String(describing: type)
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T
    }
}

// MARK: - HeaderFooterView
extension UITableView {
    /// Función para registar una clase del tipo UITableViewHeaderFooterView
    func registerHeaderClass<T: UITableViewHeaderFooterView>(_ type: T.Type) where T: Reusable {
        register(type.self, forHeaderFooterViewReuseIdentifier: T.identifier)
    }

    /// Función para inicializar el header o footer en viewForHeaderInSection
    func reusableHeaderFooter<T: UITableViewHeaderFooterView>() -> T where T: Reusable {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.identifier) as? T else {
            fatalError("Expected view to be of type \(T.identifier)")
        }
        return view
    }
}
