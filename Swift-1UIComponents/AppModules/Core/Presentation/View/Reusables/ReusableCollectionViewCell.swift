//
//  ReusableCollectionViewCell.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-04-24.
//

import UIKit

final class ReusableCollectionViewCell: UICollectionViewCell, Reusable {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    override func prepareForReuse() {
//        super.prepareForReuse()
//        contentView.subviews.forEach { view in
//            view.removeFromSuperview()
//        }
//    }

    func set(
        subview: UIView,
        top: CGFloat = .zero,
        bottom: CGFloat = .zero,
        leading: CGFloat = .zero,
        trailing: CGFloat = .zero
    ) {
        contentView.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.topAnchor.constraint(equalTo: contentView.topAnchor, constant: top).isActive = true
        subview.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: leading).isActive = true
        subview.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: trailing).isActive = true
        subview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: bottom).isActive = true
    }
}
