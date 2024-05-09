//
//  ReusableTableViewCell.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-04-24.
//

import UIKit

/// DOES NOT WORK: When you have to do a reload on the table
final class ReusableTableViewCell: UITableViewCell, Reusable {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        contentView.subviews.forEach { view in
            view.removeFromSuperview()
        }
    }

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
        subview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: leading).isActive = true
        subview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: trailing).isActive = true
        subview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: bottom).isActive = true
    }
}
