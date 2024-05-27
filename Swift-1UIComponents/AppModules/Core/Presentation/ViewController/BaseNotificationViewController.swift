//
//  BaseNotificationViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 27-05-24.
//

import UIKit
import NotificationCenter

class BaseNotificationViewController<V: BaseViewModel, C: Coordinator>: BaseViewController<V, C> {

    // Properties
    let userNotificationCenter = UNUserNotificationCenter.current()

    // Override
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.endEditing(true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
    }

}

// MARK: - Local Notification
extension BaseNotificationViewController {
    func handleUserNotification() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                self.scheduleNotification()
            case .notDetermined:
                UNUserNotificationCenter.current()
                    .requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                        if granted {
                            self.scheduleNotification()
                        }
                    }
            default:
                return
            }
        }
    }

    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Recordatorio"
        content.body = "Esta es una notificación local simple."
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 8, repeats: false)
        let request = UNNotificationRequest(
            identifier: "simpleNotification",
            content: content,
            trigger: trigger)

        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.removeDeliveredNotifications(withIdentifiers: ["simpleNotification"])
        notificationCenter.add(request)
    }
}
