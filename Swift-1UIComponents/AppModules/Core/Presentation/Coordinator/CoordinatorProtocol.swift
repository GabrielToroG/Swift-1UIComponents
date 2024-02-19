//
//  CoordinatorProtocol.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 18-02-24.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    var navigationController: UINavigationController { get set }
    func didDeinit(_ coordinator: CoordinatorProtocol)
    func start()
    func reset()
}
