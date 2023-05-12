//
//  TextFieldsViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 12-05-23.
//

import Foundation

class TextFieldsViewController: BaseViewController<TextFieldsViewModel> {
    // MARK: - Properties
    
    // MARK: - Outlets
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        configUI()
    }
    
    // MARK: - UI Functions
    private func configUI() {
        configConstraints()
    }
    private func configConstraints() {
        
    }
}
