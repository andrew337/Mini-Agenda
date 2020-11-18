//
//  AppDelegate.swift
//  Pocket Agenda
//
//  Created by Admin on 9/13/20.
//  Copyright © 2020 Holmes Org. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //print(Realm.Configuration.defaultConfiguration.fileURL)
        
//        do {
//        try FileManager.default.removeItem(at: Realm.Configuration.defaultConfiguration.fileURL!)
//        } catch {
//            print("cannot delete file")
//        }
        do {
            _ = try Realm()
        } catch {
            print("Error initialising new realm, \(error)")
        }
        
        return true
    }

}
