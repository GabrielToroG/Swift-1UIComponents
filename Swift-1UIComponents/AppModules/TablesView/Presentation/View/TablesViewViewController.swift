//
//  TablesViewViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-06-23.
//

import Foundation

import UIKit

class TablesViewViewController: BaseViewController<TablesViewViewModel> {
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
