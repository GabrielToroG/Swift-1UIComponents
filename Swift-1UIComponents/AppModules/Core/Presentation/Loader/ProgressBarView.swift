//
//  ProgressBarView.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-02-24.
//

import UIKit

// MARK: - Class
class ProgressBarView: UIView {
    private enum Constants {
        static let animationDuration: TimeInterval = 2.0
        static let animationDelay: TimeInterval = 0.1
    }

    // Outlets
    private let progressView: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.Colors.yellowColor.color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // Properties
    private var progressViewWidthConstraint: NSLayoutConstraint!
    private let progressDuration: TimeInterval = Constants.animationDuration

    // Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// se llama cuando la vista se agrega a una ventana o se retira de una ventana.
    override func didMoveToWindow() {
        super.didMoveToWindow()
        if window == nil {
            stopProgressAnimation()
        } else {
            startProgressAnimation()
        }
    }
}

// MARK: - UI Functions
extension ProgressBarView {
    private func configUI() {
        addSubview(progressView)
        progressViewWidthConstraint = progressView.widthAnchor.constraint(
            equalToConstant: frame.width)
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor),
            progressViewWidthConstraint
        ])
    }
}

// MARK: - Actions
extension ProgressBarView {
    func startProgressAnimation() {
        progressViewWidthConstraint.constant = .zero
        layoutIfNeeded()

        UIView.animate(
            withDuration: progressDuration,
            delay: Constants.animationDelay,
            options: .curveEaseOut,
            animations: {
                self.progressViewWidthConstraint.constant = self.frame.width
                self.layoutIfNeeded()
            },
            completion: { finished in
                if finished {
                    self.progressViewWidthConstraint.constant = .zero
                    self.layoutIfNeeded()
                    self.startProgressAnimation()
                }
            }
        )
    }

    func stopProgressAnimation() {
        progressView.layer.removeAllAnimations()
        progressView.removeFromSuperview()
        progressViewWidthConstraint = nil
    }
}
