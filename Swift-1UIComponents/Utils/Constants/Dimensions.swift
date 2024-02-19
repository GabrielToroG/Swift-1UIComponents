//
//  Dimensions.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-02-24.
//

import UIKit

enum Dimensions {
    enum Margin {
        /// CGFloat = 0
        static let zero: CGFloat = 0
        /// CGFloat = 4
        static let tiny: CGFloat = 4
        /// CGFloat = 8
        static let small: CGFloat = 8
        /// CGFloat = 16
        static let normal: CGFloat = 16
        /// CGFloat = 32
        static let big: CGFloat = 32
        /// CGFloat = 64
        static let extreme: CGFloat = 64
    }

    enum BorderWidth {
        /// CGFloat = 1
        static let minimum: CGFloat = 1
        /// CGFloat = 8
        static let normal: CGFloat = 8
        /// CGFloat = 16
        static let big: CGFloat = 16
    }

    enum Icon {
        /// CGFloat = 28
        static let normal: CGFloat = 28
    }

    enum Label {
        /// CGFloat = 176
        static let maxWidth: CGFloat = 176
        /// CGFloat = -2
        static let strokeWidth: CGFloat = -2
    }

    enum LoaderView {
        /// CGFloat = 146
        static let logoSize: CGFloat = 146
        /// CGFloat = 6
        static let barHeight: CGFloat = 6
        /// CGFloat = 3
        static let barCorner: CGFloat = 3
        /// CGFloat = 1
        static let horizontalPadding: CGFloat = 1
    }

    enum Priorities {
        static let huggingPriority: UILayoutPriority = .init(rawValue: 252)
        static let compressPriority: UILayoutPriority = .init(rawValue: 752)
    }
}
