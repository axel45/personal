//
//  AppDelegate.swift
//  20210301_COVID19
//
//  Created by 佐藤省吾 on 2021/03/01.
//

import UIKit
import Firebase
import FirebaseFirestore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for cus omization after application launch.
        FirebaseApp.configure()
        Firestore.firestore().collection("users").document("Message").setData([
             "UserMessage": "message",
             "Data": "messageData",
             "UserId": "messageId"
        ],merge: false) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
        CovidAPI.getPrefecture(completion: {(result: [CovidInfo.Prefecture]) -> Void in
            CovidSingleton.shared.prefecture = result
        })
        return true
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

