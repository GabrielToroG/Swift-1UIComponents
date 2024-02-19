//
//  NotificationCenterWrapper.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 18-02-24.
//

import Foundation

public protocol NotificationCenterWrapper {
    func post(
        name aName: NSNotification.Name,
        object anObject: Any?
    )
    func post(
        name aName: NSNotification.Name,
        object anObject: Any?,
        userInfo aUserInfo: [AnyHashable: Any]?
    )
    func addObserver(
        _ observer: Any,
        selector: Selector,
        name: NSNotification.Name?,
        object: Any?
    )
    func removeObserver(
        _ observer: Any,
        name: NSNotification.Name?,
        object: Any?
    )
}
