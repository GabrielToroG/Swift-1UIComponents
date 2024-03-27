//
//  RoundedProgressBar.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 27-03-24.
//

import UIKit

final class RoundedProgressBar: UIView, BaseProgressBar {

    private enum Constants {
        static let halfDivider: CGFloat = 2
    }

    private let progressLayer = CALayer()

    private var progress: Float = .zero

    func configure(progress: Float) {
        self.progress = progress
        setNeedsLayout()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        progressLayer.frame = CGRect(
            x: .zero,
            y: .zero,
            width: bounds.width * CGFloat(progress),
            height: bounds.height)
        progressLayer.backgroundColor = tintColor.cgColor
        progressLayer.cornerRadius = bounds.height / Constants.halfDivider
        layer.addSublayer(progressLayer)
    }
}
