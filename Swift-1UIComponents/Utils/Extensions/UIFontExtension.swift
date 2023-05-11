//
//  UIFontExtension.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 10-05-23.
//

import UIKit

extension UIFont {
    static let montserratRegularName = "Montserrat-Regular"
    static let montserratSemiBoldName = "Montserrat-SemiBold"
    static let montserratBoldName = "Montserrat-Bold"
    static let montserratLightName = "Montserrat-Light"
}

// MARK: - Montserrat Light
extension UIFont {
    static var montserratLight12: UIFont {
        return UIFont(name: UIFont.montserratLightName, size: 12.0)!
    }

    static var montserratLight14: UIFont {
        return UIFont(name: UIFont.montserratLightName, size: 14.0)!
    }

    static var montserratLight20: UIFont {
        return UIFont(name: UIFont.montserratLightName, size: 20.0)!
    }

    static var montserratLightFontMetrics: UIFont {
        return UIFontMetrics.default.scaledFont(for: .montserratLight14)
    }
}

// MARK: - Montserrat Regular
extension UIFont {
    static var montserratRegular10: UIFont {
        return UIFont(name: UIFont.montserratRegularName, size: 10.0)!
    }

    static var montserratRegular11: UIFont {
        return UIFont(name: UIFont.montserratRegularName, size: 11.0)!
    }

    static var montserratRegular12: UIFont {
        return UIFont(name: UIFont.montserratRegularName, size: 12.0)!
    }

    static var montserratRegular13: UIFont {
        return UIFont(name: UIFont.montserratRegularName, size: 13.0)!
    }

    static var montserratRegular14: UIFont {
        return UIFont(name: UIFont.montserratRegularName, size: 14.0)!
    }

    static var montserratRegular15: UIFont {
        return UIFont(name: UIFont.montserratRegularName, size: 15.0)!
    }

    static var montserratRegular16: UIFont {
        return UIFont(name: UIFont.montserratRegularName, size: 16.0)!
    }

    static var montserratRegular17: UIFont {
        return UIFont(name: UIFont.montserratRegularName, size: 17.0)!
    }

    static var montserratRegular18: UIFont {
        return UIFont(name: UIFont.montserratRegularName, size: 18.0)!
    }

    static var montserratRegular20: UIFont {
        return UIFont(name: UIFont.montserratRegularName, size: 20.0)!
    }

    static var montserratRegular24: UIFont {
        return UIFont(name: UIFont.montserratRegularName, size: 24.0)!
    }

    static var montserratRegularFontMetrics: UIFont {
        return UIFontMetrics.default.scaledFont(for: .montserratRegular14)
    }
}

// MARK: - Montserrat Semibold
extension UIFont {
    static var montserratSemibold10: UIFont {
        return UIFont(name: UIFont.montserratSemiBoldName, size: 10.0)!
    }

    static var montserratSemibold11: UIFont {
        return UIFont(name: UIFont.montserratSemiBoldName, size: 11.0)!
    }

    static var montserratSemibold12: UIFont {
        return UIFont(name: UIFont.montserratSemiBoldName, size: 12.0)!
    }

    static var montserratSemibold14: UIFont {
        return UIFont(name: UIFont.montserratSemiBoldName, size: 14.0)!
    }

    static var montserratSemibold16: UIFont {
        return UIFont(name: UIFont.montserratSemiBoldName, size: 16.0)!
    }

    static var montserratSemibold18: UIFont {
        return UIFont(name: UIFont.montserratSemiBoldName, size: 18.0)!
    }

    static var montserratSemibold20: UIFont {
        return UIFont(name: UIFont.montserratSemiBoldName, size: 20.0)!
    }

    static var montserratSemiBoldFontMetrics: UIFont {
        return UIFontMetrics.default.scaledFont(for: .montserratSemibold14)
    }
}

// MARK: - Montserrat Bold
extension UIFont {
    static var montserratBold12: UIFont {
        return UIFont(name: UIFont.montserratBoldName, size: 12.0)!
    }

    static var montserratBold14: UIFont {
        return UIFont(name: UIFont.montserratBoldName, size: 14.0)!
    }

    static var montserratBold15: UIFont {
        return UIFont(name: UIFont.montserratBoldName, size: 15.0)!
    }

    static var montserratBold16: UIFont {
        return UIFont(name: UIFont.montserratBoldName, size: 16.0)!
    }

    static var montserratBold17: UIFont {
        return UIFont(name: UIFont.montserratBoldName, size: 17.0)!
    }

    static var montserratBold18: UIFont {
        return UIFont(name: UIFont.montserratBoldName, size: 18.0)!
    }

    static var montserratBold20: UIFont {
        return UIFont(name: UIFont.montserratBoldName, size: 20.0)!
    }

    static var montserratBold22: UIFont {
        return UIFont(name: UIFont.montserratBoldName, size: 22.0)!
    }

    static var montserratBold24: UIFont {
        return UIFont(name: UIFont.montserratBoldName, size: 24.0)!
    }

    static var montserratBoldFontMetrics: UIFont {
        return UIFontMetrics.default.scaledFont(for: .montserratBold14)
    }
}
