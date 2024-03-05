//
//  LongPressGestureRecognizer.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 05-03-24.
//

import UIKit

final class LongPressGestureRecognizer: UILongPressGestureRecognizer {
    let onLongPress: () -> Void

    init(onLongPress: @escaping () -> Void) {
        self.onLongPress = onLongPress
        super.init(target: nil, action: nil)
        self.addTarget(self, action: #selector(handleLongPress(_:)))
    }

    @objc private func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            onLongPress()
        }
    }
}
