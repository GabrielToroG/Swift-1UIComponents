//
//  ClickableGestureRecognizer.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 05-03-24.
//

import UIKit

final class ClickableGestureRecognizer: UITapGestureRecognizer {
    let onClick: () -> Void

    init(
        onClick: @escaping () -> Void,
        target: UIView,
        action: Selector,
        cancelsTouchesInView: Bool
    ) {
        self.onClick = onClick
        super.init(target: target, action: action)
        self.cancelsTouchesInView = cancelsTouchesInView
    }
}
