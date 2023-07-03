//
//  UiConstants.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-05-23.
//

import UIKit

struct UiConstants {
    static let primaryLabelColor: UIColor = .blackColor
    static let primaryBackgroundColor: UIColor = .brandColor
    static let transparentBackgroundColor: UIColor = .blackColor.withAlphaComponent(0.6)
    static let primaryLoaderColor: UIColor = .yellowColor
}

// MARK: - Spaces
extension UiConstants {
    /// CGFloat = 0
    static let NO_SPACE: CGFloat = 0
    /// CGFloat = 4
    static let TINY_SPACE: CGFloat = 4
    /// CGFloat = 8
    static let SMALL_SPACE: CGFloat = 8
    /// CGFloat = 16
    static let NORMAL_SPACE: CGFloat = 16
    /// CGFloat = 32
    static let BIG_SPACE: CGFloat = 32
    /// CGFloat = 64
    static let EXTREME_SPACE: CGFloat = 64

    static let SMALL_RADIUS: CGFloat = 1
}

// MARK: - Containers
extension UiConstants {
    /// CGFloat = 64
    static let NORMAL_SIZE_VIEW: CGFloat = 64
    /// CGFloat = 40
    static let SMALL_HEIGHT_STACKVIEW: CGFloat = 40
}

// MARK: - Logo
extension UiConstants {
    /// CGFloat = 5
    static let NORMAL_HEIGHT_LOADER: CGFloat = 5
    /// CGFloat = 146
    static let NORMAL_SIZE_LOGO: CGFloat = 146
}

// MARK: - Popups
extension UiConstants {
    /// CGFloat = 64
    static let NORMAL_SIZE_TOAST: CGFloat = 64
    /// CGFloat = 16
    static let SMALL_RADIUS_TOAST: CGFloat = 16
}

// MARK: - Labels
extension UiConstants {
    /// CGFloat = 144
    static let MAX_WIDTH_LABEL: CGFloat = 144
}

// MARK: - Icons
extension UiConstants {
    static let SMALL_SIZE_ICON: CGFloat = 24
    static let NORMAL_SIZE_ICON: CGFloat = 32
}

// MARK: - Buttons
extension UiConstants {
    static let SMALL_SIZE_BUTTON: CGFloat = 40
    static let NORMAL_SIZE_BUTTON: CGFloat = 48
    static let SMALL_RADIUS_BUTTON: CGFloat = 20
    static let NORMAL_RADIUS_BUTTON: CGFloat = 24
}

// MARK: - TextFields
extension UiConstants {
    /// CGFloat = 16
    static let NORMAL_SIZE_TEXTFIELD_DESCRIPTION: CGFloat = 16
    /// CGFloat = 64
    static let NORMAL_WIDTH_TEXTFIELD: CGFloat = 64
    /// CGFloat = 40
    static let NORMAL_HEIGHT_TEXTFIELD: CGFloat = 40
    /// CGFloat = 16
    static let LEFT_PADDING_TEXTFIELD: CGFloat = 16
    /// CGFloat = 48
    static let RIGHT_PADDING_TEXTFIELD: CGFloat = 48
}
