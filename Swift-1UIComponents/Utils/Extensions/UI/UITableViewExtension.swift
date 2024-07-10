//
//  UITableViewExtension.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-02-24.
//

import UIKit

// MARK: - Cell Register
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

// MARK: - HeaderFooterView Register
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

// MARK: - Cells Control
extension UITableView {
    /// Función para seleccionar todas las celdas de una casilla
    func selectAllRows() {
        let totalRows = self.numberOfRows(inSection: .zero)
        for row in .zero..<totalRows {
            self.selectRow(at: IndexPath(row: row, section: .zero), animated: true, scrollPosition: .none)
        }
    }
    /// Función para des-seleccionar todas las celdas de una casilla
    func deselectAllRows() {
        let totalRows = self.numberOfRows(inSection: .zero)
        for row in .zero..<totalRows {
            self.deselectRow(at: IndexPath(row: row, section: .zero), animated: true)
        }
    }

    /// Devuelve los IndexPath de las celdas que han sido seleccionados
    func getSelectedRows() -> [IndexPath] {
        guard let selectedIndexPaths = indexPathsForSelectedRows else {
            return []
        }
        return selectedIndexPaths
    }

    /// Devuelve los IndexPath de las celdas que han sido seleccionados, ordenados de mayor a menor
    func getSelectedRowsForDeletion() -> [IndexPath] {
        guard let selectedIndexPaths = indexPathsForSelectedRows else {
            return []
        }

        let sortedIndexPaths = selectedIndexPaths.sorted { $0.row > $1.row }
        var indexPathsToDelete: [IndexPath] = []

        for indexPath in sortedIndexPaths {
            indexPathsToDelete.append(indexPath)
        }

        return indexPathsToDelete
    }
}
