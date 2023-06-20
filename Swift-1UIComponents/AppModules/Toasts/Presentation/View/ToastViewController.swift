//
//  ToastViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 04-06-23.
//

import UIKit

class ToastViewController: BaseViewController<ToastViewModel> {
    private enum Constants {
        enum Base {
            enum General {
                static let title: String = "Toasts"
                static let color: UIColor = .brandColor
            }
        }
    }
    // MARK: - Properties

    // MARK: - Outlets
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        viewModel.showLoading()
    }
    
    // MARK: - UI Functions
    private func configUI() {
        configBasic(Constants.Base.General.title, Constants.Base.General.color)
        configConstraints()        
        suscribeToToast()
    }
    private func configConstraints() {

    }
}
