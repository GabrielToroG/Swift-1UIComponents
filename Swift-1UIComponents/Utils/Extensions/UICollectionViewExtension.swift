//
//  UICollectionViewExtension.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-04-24.
//

import UIKit

extension UICollectionView {
    func registerCellClass<T: UICollectionViewCell>(
        _ type: T.Type
    ) where T: Reusable {
        register(type.self, forCellWithReuseIdentifier: T.identifier)
    }
    
    func dequeueReusableCell<T>(
        forType type: T.Type,
        at indexPath: IndexPath
    ) -> T? where T: UICollectionViewCell {
        let identifier = String(describing: type)
        return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T
    }
}
