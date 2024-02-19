//
//  UiHomeOption.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-02-24.
//

import UIKit

struct UiHomeOption {
    let icon: UIImage
    let title: String
    
    init(
        icon: UIImage = UIImage(),
        title: String = ""
    ) {
        self.icon = icon
        self.title = title
    }
}
