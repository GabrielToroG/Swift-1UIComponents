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
    
    enum Priorities {
        static let huggingPriority: UILayoutPriority = .init(rawValue: 252)
        static let compressPriority: UILayoutPriority = .init(rawValue: 752)
    }
    
    enum Alpha {
        /// CGFloat = 0.3
        static let normal: CGFloat = 0.3
    }
    
    enum Shadow {
        static let opacity: Float = 0.1
        static let radius: CGFloat = 8
        static let offset: CGSize = CGSize(width: 0, height: 0)
    }
    
    enum BorderRadius {
        /// CGFloat = 4
        static let small: CGFloat = 4
        /// CGFloat = 8
        static let normal: CGFloat = 8
        /// CGFloat = 16
        static let big: CGFloat = 16
        /// CGFloat = 24
        static let extreme: CGFloat = 24
    }
    
    enum BorderWidth {
        /// CGFloat = 1
        static let minimum: CGFloat = 1
        /// CGFloat = 8
        static let normal: CGFloat = 8
        /// CGFloat = 16
        static let big: CGFloat = 16
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
    }

    enum Separator {
        /// CGFloat = 1
        static let normalHeight: CGFloat = 1
        /// CGFloat = 2
        static let bigHeight: CGFloat = 2
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
            static let normalHeight: CGFloat = 16
            /// CGFloat = 21
            static let bigHeight: CGFloat = 21
        }
        /// Float = 100
        static let toDecimal: Float = 100
    }

    enum Label {
        enum Width {
            /// CGFloat = 112
            static let normal: CGFloat = 112
            /// CGFloat = 176
            static let extreme: CGFloat = 176
        }
        enum lines {
            /// Int = 1
            static let one: Int = 1
            /// Int = 1
            static let two: Int = 2
            /// Int = 1
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
        static let bigSize: CGFloat = 32
    }

    enum Images {
        /// CGFloat = 200
        static let bigSize: CGFloat = 160
    }

    enum TableView {
        /// CGFloat = 40
        static let headerViewHeight: CGFloat = 40
    }
}
