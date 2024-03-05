//
//  UIViewExtensions.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 05-03-24.
//

import UIKit

extension UIView {
    @objc func onClick(
        cancelsTouchesInView: Bool = true,
        _ onClick: @escaping () -> Void
    ) {
        let clickableGestureRecognizer = ClickableGestureRecognizer(
            onClick: onClick,
            target: self,
            action: #selector(callAction(_:)),
            cancelsTouchesInView: cancelsTouchesInView
        )
        addGestureRecognizer(clickableGestureRecognizer)
    }

    @objc private func callAction(_ sender: ClickableGestureRecognizer) {
        sender.onClick()
    }
}
