//
//  CircleButtonArgs.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 03-06-23.
//

import UIKit

struct CircleButtonArgs {
    let backgroundColor: UIColor
    let image: UIImage?
    let imageColor: UIColor
    init(
        backgroundColor: UIColor = .brownColor,
        image: UIImage? = UIImage(systemName: "chevron.left"),
        imageColor: UIColor = UIColor.blackColor
    ) {
        self.backgroundColor = backgroundColor
        self.image = image
        self.imageColor = imageColor
    }
}
