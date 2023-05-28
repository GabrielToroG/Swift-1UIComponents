//
//  FillerButtonArgs.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 27-05-23.
//

import UIKit

struct FillerButtonArgs {
    let title: String
    let titleColor: UIColor
    let backgroundColor: UIColor
    init(
        title: String,
        titleColor: UIColor = .blackColor,
        backgroundColor: UIColor = .brownColor
    ) {
        self.title = title
        self.titleColor = titleColor
        self.backgroundColor = backgroundColor
    }
}
