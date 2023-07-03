//
//  UIViewExtension.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-07-23.
//

import UIKit

extension UIView {
    /// Util para darle a cualquier UIView o derivado de este la función del onClick
    @objc func onClick(
        cancelsTouchesInView: Bool = true,
        _ onClick: @escaping () -> Void
    ) {
        let clickableGestureRecognizer = ClickableGestureRecognizer(
            onClick: onClick,
            target: self,
            action: #selector(callListener(_:)),
            cancelsTouchesInView: cancelsTouchesInView
        )
        addGestureRecognizer(clickableGestureRecognizer)
    }

    /// Complemento de la función onClick
    @objc private func callListener(_ sender: ClickableGestureRecognizer) {
        sender.onClick()
    }
}
