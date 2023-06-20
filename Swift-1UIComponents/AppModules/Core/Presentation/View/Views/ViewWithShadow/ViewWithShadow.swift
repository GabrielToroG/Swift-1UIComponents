//
//  ViewWithShadow.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 06-06-23.
//

import UIKit

class ViewWithShadow: UIView {
    private enum Constants {
        static let headerShadowRadius: CGFloat = 8
        static let headerShadowOpacity: Float = 0.1
        static let headerShadowOffset = CGSize(width: 0, height: 0)
    }

    // MARK: - Config
    var data: ViewWithShadowArgs? {
        didSet {
            guard let data = data else { return }
            layer.cornerRadius = data.radius
            layer.shadowOffset = data.shadowOffset
        }
    }

    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configShadowOnView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configShadowOnView()
    }

    // MARK: - UI Functions
    private func configShadowOnView() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.blackColor.cgColor
        layer.shadowOpacity = Constants.headerShadowOpacity
        layer.shadowRadius = Constants.headerShadowRadius
    }
}
