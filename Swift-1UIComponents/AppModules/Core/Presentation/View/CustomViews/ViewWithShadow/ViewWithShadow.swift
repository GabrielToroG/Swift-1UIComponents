//
//  ViewWithShadow.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 04-03-24.
//

import UIKit

// MARK: - Class
class ViewWithShadow: UIView {

    // Config
    func config(_ args: ViewWithShadowArgs) {
        layer.masksToBounds = false
        layer.cornerRadius = args.cornerRadius
        layer.shadowColor = args.shadowColor.cgColor
        layer.shadowOpacity = args.shadowOpacity
        layer.shadowRadius = args.shadowRadius
        layer.shadowOffset = args.shadowOffset
    }
}
