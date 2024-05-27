//
//  ViewWithBottomSheet.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 13-05-24.
//

import UIKit

final class ModalFeedbackViewController: BaseViewController<ModalFeedbackViewModel, ViewsCoordinator> {
    // Outlets
    // Properties
}

// MARK: - Lifecycle
extension ModalFeedbackViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
}

// MARK: - UI Functions
extension ModalFeedbackViewController {
    private func configUI() {
        configBasic("", UIColor.white)
        configConstraints()
    }
    
    private func configConstraints() {
        
    }
}
