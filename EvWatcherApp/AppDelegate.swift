//
//  AppDelegate.swift
//  EvWatcherApp
//
//  Created by 한준혁 on 2023/02/04.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate , UNUserNotificationCenterDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // APNS 설정
            UNUserNotificationCenter.current().delegate = self

            UNUserNotificationCenter.current()
                .requestAuthorization(options: [.alert, .sound, .badge]) {
                    [weak self] granted, error in
                
                    print("Permission granted: \(granted)")
            }

            // APNS 등록
            application.registerForRemoteNotifications()
        return true
    }

    // 실패시
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register for notifications: \(error.localizedDescription)")
    }
        
    // 성공시
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
          let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
          let token = tokenParts.joined()
          print("Device Token: \(token)")
    }
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        // Update the app interface directly.
        
        if let charger_id:String = notification.request.content.userInfo["CHARGER_ID"] as? String {
            print(charger_id)
            if let charger_address:String = notification.request.content.userInfo["CHARGER_ADDRESS"] as? String {
                print(charger_address)
                if let charger_status:String = notification.request.content.userInfo["CHARGER_STATUS"] as? String {
                    print(charger_status)
                    if let charger_duration:Int = notification.request.content.userInfo["CHARGER_DURATION"] as? Int {
                        print(charger_duration)
                        let c = Charger(chargerId: charger_id, address: charger_address, status: charger_status, current_image: nil, duration: Duration.seconds(charger_duration))
                        ChargerDataSource.shared.upsertCharger(charger:c)
                    }
                }
            }
        }
        
        // Show a banner
        completionHandler(.banner)

    }
    
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

