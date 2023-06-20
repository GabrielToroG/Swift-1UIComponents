//
//  UIButtonExtension.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 06-06-23.
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
            titleLabel?.font = .montserratSemibold17
            heightAnchor.constraint(equalToConstant: UiConstants.NORMAL_BUTTON_SIZE).isActive = true
            setTitleColor(.blackColor, for: .normal)
            backgroundColor = .brownColor
            isEnabled = true
            layer.cornerRadius = UiConstants.NORMAL_BUTTON_RADIUS
        case .shadowFilled:
            titleLabel?.font = .montserratSemibold17
            heightAnchor.constraint(equalToConstant: UiConstants.NORMAL_BUTTON_SIZE).isActive = true
            setTitleColor(.blackColor, for: .normal)
            backgroundColor = .brownColor
            isEnabled = true
            layer.cornerRadius = UiConstants.NORMAL_BUTTON_RADIUS
            configButtonShadow(show: true)
        case .bordered:
            titleLabel?.font = .montserratSemibold17
            heightAnchor.constraint(equalToConstant: UiConstants.NORMAL_BUTTON_SIZE).isActive = true
            setTitleColor(.blackColor, for: .normal)
            backgroundColor = .clear
            isEnabled = true
            layer.cornerRadius = UiConstants.NORMAL_BUTTON_RADIUS
            layer.borderWidth = 1
            layer.borderColor = UIColor.blackColor.cgColor
        case .noBackgroundColor:
            print("")
        case .noBackgroundGray:
            print("")
        case .disable:
            print("")
        }
    }
    
    private func configButtonShadow(show: Bool) {
        let shadowOpacitiy: Float = show ? 0.2 : 0
        let shadowRadius: CGFloat = show ? 1 : 0
        let shadowOffset = CGSize(width: 0, height: show ? 4 : 0)
        layer.shadowOpacity = shadowOpacitiy
        layer.shadowRadius = shadowRadius
        layer.shadowColor = UIColor.blackColor.cgColor
        layer.shadowOffset = shadowOffset
    }
}
