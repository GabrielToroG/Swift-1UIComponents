//
//  GradientProgressBar.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 27-03-24.
//

import UIKit

enum GradientDirection {
    case leftTopToRightBottom
    case leftCenterToRightCenter
    case leftBottomToRightTop

    var startPoint: CGPoint {
            switch self {
            case .leftTopToRightBottom:
                return CGPoint(x: 0, y: 0)
            case .leftCenterToRightCenter:
                return CGPoint(x: 0, y: 0.5)
            case .leftBottomToRightTop:
                return CGPoint(x: 0, y: 1)
            }
        }
        
        var endPoint: CGPoint {
            switch self {
            case .leftTopToRightBottom:
                return CGPoint(x: 1, y: 1)
            case .leftCenterToRightCenter:
                return CGPoint(x: 1, y: 0.5)
            case .leftBottomToRightTop:
                return CGPoint(x: 1, y: 0)
            }
        }
}

final class GradientProgressBar: UIView, BaseProgressBar {

    private enum Constants {
        static let halfDivider: CGFloat = 2
    }

    private let progressLayer = CAGradientLayer()

    private var progress: Float = .zero
    private var gradientColors: [UIColor] = [.red, .blue]
    private var gradientDirection: GradientDirection = .leftTopToRightBottom

    func configure(
        progress: Float,
        gradientColors: [UIColor],
        gradientDirection: GradientDirection
    ) {
        self.progress = progress
        self.gradientColors = gradientColors
        self.gradientDirection = gradientDirection
        setNeedsLayout()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        progressLayer.frame = CGRect(
            x: .zero,
            y: .zero,
            width: bounds.width * CGFloat(progress),
            height: bounds.height)
        progressLayer.colors = gradientColors.map { $0.cgColor }
        progressLayer.cornerRadius = bounds.height / Constants.halfDivider
        progressLayer.startPoint = gradientDirection.startPoint
        progressLayer.endPoint = gradientDirection.endPoint
        layer.addSublayer(progressLayer)
    }
}
