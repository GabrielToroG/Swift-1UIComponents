//
//  ProgressBarView.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-05-23.
//

import UIKit

// MARK: - Class
class ProgressBarView: UIView {
    private enum Constants {
        enum View {
            enum Progress {
                static let color: UIColor = .systemYellow
            }
        }
    }

    // Outlets
    private let progressView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.View.Progress.color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // Properties
    private var progressViewWidthConstraint: NSLayoutConstraint!
    private let progressDuration: TimeInterval = 2.0

    // Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI Functions
extension ProgressBarView {
    private func configViews() {
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
        progressViewWidthConstraint.constant = 0 // Aquí establecemos la constante en 0 para que la barra de progreso comience desde la izquierda
        layoutIfNeeded()

        UIView.animate(withDuration: progressDuration, delay: 0, options: .curveLinear, animations: {
            self.progressViewWidthConstraint.constant = self.frame.width
            self.layoutIfNeeded()
        }, completion: { finished in
            if finished {
                self.progressViewWidthConstraint.constant = 0
                self.layoutIfNeeded()
                self.startProgressAnimation()
            }
        })
    }

    func stopProgressAnimation() {
        progressView.layer.removeAllAnimations()
        progressView.removeFromSuperview()
        progressViewWidthConstraint = nil
    }
}



