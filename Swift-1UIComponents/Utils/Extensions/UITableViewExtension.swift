//
//  UITableViewExtension.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-05-23.
//

import UIKit

extension UITableView {
    /// Función para registrar la celda más rápido
    func registerCellClass(for cellClass: UITableViewCell.Type) {
        let className = String(describing: cellClass)
        register(cellClass, forCellReuseIdentifier: className)
    }

    /// Función para inicializar la celda dentro de la extensión
    func dequeueReusableCell<Cell: UITableViewCell>(with type: Cell.Type, for indexPath: IndexPath) -> Cell {
        return dequeueReusableCell(withIdentifier: String(describing: type), for: indexPath) as! Cell
    }

    /// Función para asignarle un Header a un TableView
    func setAndLayoutTableHeaderView(header: UIView) {
        header.layoutIfNeeded()
        self.tableHeaderView = header
        let height = header.systemLayoutSizeFitting(
            .init(width: bounds.width, height: .zero),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .defaultLow
        ).height
        var frame = header.frame
        frame.size.height = height
        header.frame = frame
        self.tableHeaderView = header
    }
}
