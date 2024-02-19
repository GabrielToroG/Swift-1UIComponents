//
//  HomeViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 18-02-24.
//

import UIKit

final class HomeViewController: BaseViewController<HomeViewModel, HomeCoordinator> {
    // Properties
    
    // Outlets
}

// MARK: - Lifecycle
extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configUI()
    }
}

// MARK: - UI Functions
extension HomeViewController {
    private func configUI() {
        configConstraints()
    }
    
    private func configConstraints() {
        
    }
}
