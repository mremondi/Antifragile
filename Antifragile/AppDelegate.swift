//
//  AppDelegate.swift
//  Antifragile
//
//  Created by Michael Remondi on 9/19/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        hasAppBeenLaunchedBefore()
        
        // Firebase set up
        FirebaseApp.configure()
        
        // Get the current game state level from firebase, get it once, save it, and move to rest of app
        let levelRef = Database.database().reference().child("app_state")
        levelRef.observeSingleEvent(of: DataEventType.value, with: { [weak self] (snapshot) in
            let levelNumber = snapshot.value as? Int ?? -1
            // save current level # to UserDefaults
            self?.saveCurrentLevelFromFirebase(levelNumber: levelNumber)
            // go to app
            let container = DependencyContainer()
            let appNavigator = AppNavigator(window: self?.window, factory: container)
            appNavigator.run()
        })
        
        // APP WIDE SET UP
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
    }
    
    private func saveCurrentLevelFromFirebase(levelNumber: Int){
        let defaults = UserDefaults.standard
        defaults.set(levelNumber, forKey: "currentGameStateLevel")
    }
    
    private func hasAppBeenLaunchedBefore(){
        let defaults = UserDefaults.standard
        
        if let _ = defaults.string(forKey: "isAppAlreadyLaunchedOnce"){
            defaults.set(true, forKey: "isAppAlreadyLaunchedOnce")
        }else{
            defaults.set(false, forKey: "isAppAlreadyLaunchedOnce")
        }
    }
}

