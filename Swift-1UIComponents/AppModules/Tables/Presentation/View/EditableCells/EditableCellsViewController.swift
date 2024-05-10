//
//  EditableCellsViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 09-05-24.
//

import UIKit

final class EditableCellsViewController: BaseViewController<EditableCellsViewModel, TablesViewCoordinator> {
    // Outlets
    private lazy var buttonContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    // Properties
}

// MARK: - Lifecycle
extension EditableCellsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configBindings()
        viewModel.onViewDidLoad()
    }
}

// MARK: - Bindings
extension EditableCellsViewController {
    private func configBindings() {
        
    }
}

// MARK: - UI Functions
extension EditableCellsViewController {
    private func configUI() {
        configBasic(L10n.Tableview.editableCells, UIColor.red)
        configConstraints()
    }
    
    private func configConstraints() {
        
    }
}
