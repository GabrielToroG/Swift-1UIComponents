//
//  BorderButtonArgs.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 28-05-23.
//

import UIKit

struct BorderButtonArgs {
    let title: String
    let titleColor: UIColor
    let borderColor: UIColor
    init(
        title: String,
        titleColor: UIColor = .blackColor,
        borderColor: UIColor = .blackColor
    ) {
        self.title = title
        self.titleColor = titleColor
        self.borderColor = borderColor
    }
}
