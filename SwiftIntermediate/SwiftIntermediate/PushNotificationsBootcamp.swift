//
//  PushNotificationsBootcamp.swift
//  SwiftIntermediate
//
//  Created by Denys on 18.05.2022.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    static let instance = NotificationManager() //singleton
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is my notification"
        content.subtitle = "Yeah it is"
        content.sound = .default
        content.badge = 1
        
        //time
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        //calender
//        var dateComponents = DateComponents()
//        dateComponents.hour = 23
//        dateComponents.minute = 48
//        dateComponents.weekday = 4
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        //location
        let coordinates = CLLocationCoordinate2D(latitude: 40.00, longitude: 50.00)
        let region = CLCircularRegion(center: coordinates, radius: 100, identifier: UUID().uuidString)
        region.notifyOnEntry = true
        region.notifyOnExit = true
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
                                            
            content: content,
                                            
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct PushNotificationsBootcamp: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Request Permisiion") {
                NotificationManager.instance.requestAuthorization()
            }
            Button("Schedule Notification") {
                NotificationManager.instance.scheduleNotification()
            }
            
            Button("Cancel Notification") {
                NotificationManager.instance.cancelNotification()
            }
        }
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct PushNotificationsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PushNotificationsBootcamp()
    }
}
