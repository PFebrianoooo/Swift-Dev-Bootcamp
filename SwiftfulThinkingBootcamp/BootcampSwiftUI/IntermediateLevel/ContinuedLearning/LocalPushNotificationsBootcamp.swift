//
//  LocalPushNotificationsBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 05/03/24.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationsManager {
    
    static let instance = NotificationsManager()
    
    func requestAuthorization() {
        // meminta izin untuk memberikan notifikasi
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error {
                print("Error Messgae:  \(error)")
            }else {
                print("Success sent Authorized")
            }
        }
    }
    
    func scheduleNotifications() {
        // sceduling notifications
        let content = UNMutableNotificationContent()
        content.title = "This is First Notifications"
        content.subtitle = "This was so eazy and fun, To learn notifications"
        content.sound = .defaultCritical
        content.badge = 1
        
        // time
        /*
         time interval menandakan sebuah waktu dalam detik
         */
//        let triggerTime = UNTimeIntervalNotificationTrigger(timeInterval: 15.0, repeats: false)
        
        // calendar
//        var dateComponents = DateComponents()
//        dateComponents.hour = 22 // format 24 jam
//        dateComponents.minute = 29 // menit berapa
//        dateComponents.day = 3 // hari ke berapa, hari di mulai dari minggu
//        let triggerTime = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // locations
        let coordinates = CLLocationCoordinate2D(latitude: 40.00, longitude: 50.00)
        let region = CLCircularRegion(
            center: coordinates,
            radius: 100,
            identifier: UUID().uuidString)
        
        // pengaturan notif apabila orangnya keluar dan masuk ke target. Dimana terletak pada variable region
        region.notifyOnExit = true
        region.notifyOnEntry =  false
        
        let triggerTime = UNLocationNotificationTrigger(region: region, repeats: true)

        
        let requestSchedule = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: triggerTime)
        UNUserNotificationCenter.current().add(requestSchedule) { error in
            if let error {
                print("Error Message: \(error)")
            }else {
                print("Sucess sent Notifications")
            }
        }
    }
    
    func resetBadgeCount() {
        // set badge ke nol atau riset ulang
        UNUserNotificationCenter.current().setBadgeCount(0) { error in
            if let error {
                print("Error Message: \(error)")
            }else {
                print("Badge count to zero")
            }
        }
    }
    
    func cancelNotifications() {
        // digunakan untuk cancel segala otif apapun dari aplikasi
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
}

struct LocalPushNotificationsBootcamp: View {
    @Environment (\.scenePhase) var scenePhase
    var body: some View {
        VStack(spacing: 20) {
            Button("Trigger notifications".capitalized) {
                NotificationsManager.instance.requestAuthorization()
            }
            
            Button("shedule Notifications".capitalized) {
                NotificationsManager.instance.scheduleNotifications()
            }
            
            Button("cancel notifications".capitalized) {
                NotificationsManager.instance.cancelNotifications()
            }
            
        }
        .buttonStyle(.borderedProminent)
        .onAppear {
            NotificationsManager.instance.resetBadgeCount()
                // for reseting badge to zero
        }
    }
}

#Preview {
    LocalPushNotificationsBootcamp()
}

// Small Summary

/*
 Push Local Notifications (UserNotifications Framework)
 Push Local Notifications adalah sebuah modifier untuk menampilkan notifikasi didalam aplikasi Iphone, dimana push local notifications dapat kita buat sendiri menggunakan modifier dalam swift dalam pembuatan aplikasi iphone.

 Perbedaan Local Notifications dan Real Push Notifications, pada local notifications kita bisa membuat sendiri notifikasi kita dengan apa yang kita mau. Sedangkan Real Push Notifications datangnya dari server.

 Push notifications merupakan sebuah cara untuk memberikan notifikasi kepada aplikasi yang bisa digunakan oleh programmer  untuk user dalam kepentingan beberapa hal:
 1. Pembaruan aplikasi
 2. Status proses terbaru
 3. Promo and many else other
 
 Mengatur Push Local Notifications dibagi menjadi 3 bagian.
 1. Berdasarkan yang akan datang (Time Based)
 2. Berdasarkan Kalender (Calendar)
 3. Berdasarkan Lokasi (Locations) Harus ada tambahan framwork CoreLocations
 
 MARK: Tata-cara Push Local Notifications
 1. Harus memberikan permisions ke device (Authorized Permissions)
 2. Menambahkan hal yang diperlukan.
 
 
  
  
 */
