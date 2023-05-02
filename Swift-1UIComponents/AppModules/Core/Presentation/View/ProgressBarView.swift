//
//  ProgressBarView.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-05-23.
//

import UIKit

class ProgressBarView: UIView {
    
    private let progressView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var progressViewWidthConstraint: NSLayoutConstraint!
    private let progressDuration: TimeInterval = 2.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProgressView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProgressView() {
        addSubview(progressView)
        progressViewWidthConstraint = progressView.widthAnchor.constraint(equalToConstant: frame.width) // Establecer el ancho predeterminado aquí
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor),
            progressViewWidthConstraint
        ])
    }
    
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



