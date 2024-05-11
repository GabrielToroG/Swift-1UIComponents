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
        static let medium: CGFloat = 32
        /// CGFloat = 48
        static let large: CGFloat = 48
        /// CGFloat = 64
        static let extraLarge: CGFloat = 64
    }
    
    enum Alpha {
        /// CGFloat = 0.3
        static let normal: CGFloat = 0.3
    }
    
    enum Shadow {
        /// Float = 0.1
        static let opacity: Float = 0.1
        /// CGFloat = 8
        static let radius: CGFloat = 8
        /// CGSize = 0 , 0
        static let offset: CGSize = CGSize(width: 0, height: 0)
    }
    
    enum BorderRadius {
        /// CGFloat = 4
        static let small: CGFloat = 4
        /// CGFloat = 8
        static let normal: CGFloat = 8
        /// CGFloat = 16
        static let medium: CGFloat = 16
        /// CGFloat = 24
        static let large: CGFloat = 24
    }
    
    enum BorderWidth {
        /// CGFloat = 1
        static let minimum: CGFloat = 1
        /// CGFloat = 8
        static let normal: CGFloat = 8
        /// CGFloat = 16
        static let medium: CGFloat = 16
    }

    enum Priorities {
        /// UILayoutPriority = 252
        static let huggingPriority: UILayoutPriority = .init(rawValue: 252)
        /// UILayoutPriority = 752
        static let compressPriority: UILayoutPriority = .init(rawValue: 752)
    }

    enum Animation {
        /// TimeInterval = 0.25
        static let normalTiming: TimeInterval = 0.25
    }

    enum Index {
        /// Int = 1
        static let one: Int = 1
    }
}

extension Dimensions {
    enum StackView {
        /// CGFloat = 4
        static let tinySpacing: CGFloat = 4
        /// CGFloat = 8
        static let smallSpacing: CGFloat = 8
        /// CGFloat = 16
        static let normalSpacing: CGFloat = 16
    }

    enum View {
        /// CGFloat = 40
        static let smallSize: CGFloat = 40
        /// CGFloat = 64
        static let normalSize: CGFloat = 64
        /// CGFloat = 88
        static let mediumSize: CGFloat = 88
    }

    enum Separator {
        /// CGFloat = 1
        static let normalHeight: CGFloat = 1
        /// CGFloat = 2
        static let mediumHeight: CGFloat = 2
        /// CGFloat =
        static let underlineWidth: CGFloat = 30
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

    enum ProgressBar {
        enum Progress {
            /// Int = 25
            static let oneQuarter: Int = 25
            /// Int = 50
            static let twoQuarter: Int = 50
            /// Int = 75
            static let threeQuarter: Int = 75
            /// Int = 100
            static let fourQuarter: Int = 100
        }
        enum Height {
            /// CGFloat = 16
            static let normal: CGFloat = 16
            /// CGFloat = 21
            static let medium: CGFloat = 21
        }
        /// Float = 100
        static let toDecimal: Float = 100
    }

    enum Label {
        enum Width {
            /// CGFloat = 112
            static let normal: CGFloat = 112
            /// CGFloat = 176
            static let large: CGFloat = 176
        }
        enum lines {
            /// Int = 1
            static let one: Int = 1
            /// Int = 2
            static let two: Int = 2
            /// Int = 3
            static let three: Int = 3
        }
        enum Stroke {
            /// CGFloat = -2
            static let normalWidth: CGFloat = -2
        }
    }

    enum Button {
        enum Height {
            /// CGFloat = 48
            static let normal: CGFloat = 48
        }
    }

    enum Textfield {
        /// CGFloat = 64
        static let leftWidth: CGFloat = 64
        /// CGFloat = 16
        static let descriptionWidth: CGFloat = 16
    }

    enum Icon {
        /// CGFloat = 24
        static let smallSize: CGFloat = 24
        /// CGFloat = 28
        static let normalSize: CGFloat = 28
        /// CGFloat = 32
        static let mediumSize: CGFloat = 32
    }

    enum Images {
        /// CGFloat = 72
        static let tinySize: CGFloat = 72
        /// CGFloat = 88
        static let smallSize: CGFloat = 88
        /// CGFloat = 104
        static let normalSize: CGFloat = 104
        /// CGFloat = 120
        static let mediumSize: CGFloat = 120
        /// CGFloat = 136
        static let largeSize: CGFloat = 136
        /// CGFloat = 152
        static let bigSize: CGFloat = 152
    }

    enum TableView {
        /// CGFloat = 40
        static let headerViewHeight: CGFloat = 40
        enum leftView {
            /// CGFloat = 48
            static let normalWidth: CGFloat = 48
        }
        enum Cell {
            /// CGFloat = 100
            static let normalHeight: CGFloat = 100
        }
    }

    enum CollectionView {
        /// CGFloat = 2
        static let normalSpacing: CGFloat = 2
        static let normalHeight: CGFloat = 116
        enum Cell {
            /// CGFloat = 200
            static let normalWidth: CGFloat = 200
            /// CGFloat = 100
            static let normalHeight: CGFloat = 100
        }
    }
}
