//
//  UIClickableCarouselSectionArgs.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 09-05-24.
//

import Foundation

struct UIClickableCarouselSectionArgs {
    let id: Int
    let title: String
    let onSelectionAction: (() -> Void)?
    var isSelected: Bool?
}
