//
//  ImagesViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 27-05-23.
//

import UIKit

class ImagesViewController: BaseViewController<ImagesViewModel> {
    private enum Constants {
        enum Base {
            enum General {
                static let title: String = ""
                static let color: UIColor = .white
            }
        }
    }
    // MARK: - Properties
    
    // MARK: - Outlets
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - UI Functions
    private func configUI() {
        configBasic(Constants.Base.General.title, Constants.Base.General.color)
        configConstraints()
    }
    private func configConstraints() {
        
    }
}
