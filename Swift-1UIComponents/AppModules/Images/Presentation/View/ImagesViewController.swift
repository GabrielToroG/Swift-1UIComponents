//
//  ImagesViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-02-24.
//

import UIKit

final class ImagesViewController: BaseViewController<ImagesViewModel, ImagesCoordinator> {
    /* -------------------------------------------------------------------------------------------------------
        scaleToFill (default): comprime la imagen para que caiga todo en el tamaño dado
        scaleAspectFill: Agrande el UIImageView para que encaje perfectamente la imagen
        scaleAspectFit: achica la imagen para que quede en el tamaño correspondiente (suele sobrar espacios)
     ------------------------------------------------------------------------------------------------------ */

    private enum Constants {
        static let url: String = "https://cdn-www.bluestacks.com/bs-images/Ragnarok-Origin_Beginners-Guide_ES_21.png"
    }

    // Properties
    private lazy var normalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var alphaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var urlImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
}

// MARK: - Lifecycle
extension ImagesViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
}

// MARK: - UI Functions
extension ImagesViewController {
    private func configUI() {
        configBasic(L10n.Images.title, Asset.Colors.brandColor.color)
        configImages()
        configConstraints()
    }

    private func configImages() {
        configNormalImage()
        configAlphaImage()
        configUrlImage()
    }
    private func configNormalImage() {
        normalImageView.backgroundColor = .systemGray
        normalImageView.image = Asset.Images.imagesWebpage.image
    }

    private func configAlphaImage() {
        alphaImageView.backgroundColor = .systemGray
        alphaImageView.image = Asset.Images.imagesWebpage.image
        alphaImageView.alpha = Dimensions.Alpha.normal
    }

    private func configUrlImage() {
        let urlString = Constants.url
        if let url = URL(string: urlString) {
            urlImageView.setStyle(.networking)
            urlImageView.setImage(from: url)
        }
        urlImageView.backgroundColor = .systemGray
    }

    private func configConstraints() {
        view.addSubview(normalImageView)
        view.addSubview(alphaImageView)
        view.addSubview(urlImageView)

        let normalImageViewViewConstraints = [
            normalImageView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            normalImageView.widthAnchor.constraint(
                equalToConstant: Dimensions.Images.bigSize),
            normalImageView.heightAnchor.constraint(
                equalToConstant: Dimensions.Images.bigSize),
            normalImageView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)
        ]
        let alphaImageViewImageViewConstraints = [
            alphaImageView.topAnchor.constraint(
                equalTo: normalImageView.bottomAnchor,
                constant: Dimensions.Margin.normal),
            alphaImageView.widthAnchor.constraint(
                equalToConstant: Dimensions.Images.bigSize),
            alphaImageView.heightAnchor.constraint(
                equalToConstant: Dimensions.Images.bigSize),
            alphaImageView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)
        ]
        let urlImageViewImageViewConstraints = [
            urlImageView.topAnchor.constraint(
                equalTo: alphaImageView.bottomAnchor,
                constant: Dimensions.Margin.normal),
            urlImageView.widthAnchor.constraint(
                equalToConstant: Dimensions.Images.bigSize),
            urlImageView.heightAnchor.constraint(
                equalToConstant: Dimensions.Images.bigSize),
            urlImageView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)
        ]

        NSLayoutConstraint.activate(
            normalImageViewViewConstraints +
            alphaImageViewImageViewConstraints +
            urlImageViewImageViewConstraints
        )
    }
}
