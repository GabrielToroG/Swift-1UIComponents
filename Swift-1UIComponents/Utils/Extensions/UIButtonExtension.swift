//
//  UIButtonExtension.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 05-03-24.
//

import UIKit

enum ButtonStyle {
    case filled
    case shadowFilled
    case bordered
    case noBackgroundColor
    case noBackgroundGray
    case disable
}

extension UIButton {
    func style(like type: ButtonStyle, isShadow: Bool = false) {
        switch type {
        case .filled:
            titleLabel?.font = Fonts.Button.button1
            heightAnchor.constraint(equalToConstant: Dimensions.Button.Height.normal).isActive = true
            setTitleColor(Asset.Colors.blackColor.color, for: .normal)
            backgroundColor = Asset.Colors.brownColor.color
            isEnabled = true
            layer.cornerRadius = Dimensions.BorderRadius.extreme
        case .shadowFilled:
            titleLabel?.font = Fonts.Button.button1
            heightAnchor.constraint(equalToConstant: Dimensions.Button.Height.normal).isActive = true
            setTitleColor(Asset.Colors.blackColor.color, for: .normal)
            backgroundColor = Asset.Colors.brownColor.color
            isEnabled = true
            layer.cornerRadius = Dimensions.BorderRadius.extreme
            configButtonShadow(show: true)
        case .bordered:
            titleLabel?.font = Fonts.Button.button1
            heightAnchor.constraint(equalToConstant: Dimensions.Button.Height.normal).isActive = true
            setTitleColor(Asset.Colors.blackColor.color, for: .normal)
            backgroundColor = .clear
            isEnabled = true
            layer.cornerRadius = Dimensions.BorderRadius.extreme
            layer.borderWidth = Dimensions.BorderWidth.minimum
            layer.borderColor = Asset.Colors.blackColor.color.cgColor
        case .noBackgroundColor:
            print("")
        case .noBackgroundGray:
            print("")
        case .disable:
            titleLabel?.font = Fonts.Button.button1
            heightAnchor.constraint(equalToConstant: Dimensions.Button.Height.normal).isActive = true
            setTitleColor(Asset.Colors.blackColor.color.withAlphaComponent(0.3), for: .normal)
            backgroundColor = Asset.Colors.brownColor.color.withAlphaComponent(0.3)
            isEnabled = false
            layer.cornerRadius = Dimensions.BorderRadius.extreme
        }
    }

    private func configButtonShadow(show: Bool) {
        let shadowOpacitiy: Float = show ? 0.2 : 0
        let shadowRadius: CGFloat = show ? 1 : 0
        let shadowOffset = CGSize(width: 0, height: show ? 4 : 0)
        layer.shadowOpacity = shadowOpacitiy
        layer.shadowRadius = shadowRadius
        layer.shadowColor = Asset.Colors.blackColor.color.cgColor
        layer.shadowOffset = shadowOffset
    }
}
