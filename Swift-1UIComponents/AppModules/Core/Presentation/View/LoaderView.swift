//
//  LoaderView.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-05-23.
//

import UIKit

class LoaderView: UIView {
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var logoContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "general-logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var progressView: ProgressBarView = {
        let progressView = ProgressBarView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(containerView)
        containerView.addSubview(logoContainerView)
        logoContainerView.addSubview(logoImageView)
        logoContainerView.addSubview(progressView)

        let containerViewConstraints = [
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        let logoContainerViewConstraints = [
            logoContainerView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            logoContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 64),
            logoContainerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -64)
        ]
        let logoImageViewConstraints = [
            logoImageView.topAnchor.constraint(equalTo: logoContainerView.topAnchor, constant: 16),
            logoImageView.centerXAnchor.constraint(equalTo: logoContainerView.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 146),
            logoImageView.widthAnchor.constraint(equalToConstant: 146)
        ]
        let progressViewConstraints = [
            progressView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 24),
            progressView.bottomAnchor.constraint(equalTo: logoContainerView.bottomAnchor, constant: -32),
            progressView.leadingAnchor.constraint(equalTo: logoContainerView.leadingAnchor, constant: 16),
            progressView.trailingAnchor.constraint(equalTo: logoContainerView.trailingAnchor, constant: -16),
            progressView.heightAnchor.constraint(equalToConstant: 5)
        ]

        NSLayoutConstraint.activate(
            containerViewConstraints +
            logoContainerViewConstraints +
            logoImageViewConstraints +
            progressViewConstraints
        )
    }
    
    func startProgressAnimation() {
        progressView.startProgressAnimation()
    }

    func stopProgressAnimation() {
        progressView.stopProgressAnimation()
    }
    
}
