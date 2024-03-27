//
//  ViewWithShadowArgs.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 04-03-24.
//

import UIKit

struct ViewWithShadowArgs {
    let cornerRadius: CGFloat
    let shadowColor: UIColor
    let shadowOffset: CGSize
    let shadowRadius: CGFloat
    let shadowOpacity: Float

    init(
        cornerRadius: CGFloat = Dimensions.BorderRadius.normal,
        shadowColor: UIColor = Asset.Colors.blackColor.color,
        shadowOffset: CGSize = Dimensions.Shadow.offset,
        shadowRadius: CGFloat = Dimensions.Shadow.radius,
        shadowOpacity: Float = Dimensions.Shadow.opacity
    ) {
        self.cornerRadius = cornerRadius
        self.shadowColor = shadowColor
        self.shadowOffset = shadowOffset
        self.shadowRadius = shadowRadius
        self.shadowOpacity = shadowOpacity
    }
}
