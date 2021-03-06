//
//  AppDelegate.swift
//  Pace
//
//  Created by ethan on 2018/5/24.
//  Copyright © 2018年 ethan. All rights reserved.
//

import UIKit
import AMapFoundationKit
import MAMapKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        _ = LocationDataSource.shared
        
        AMapServices.shared().enableHTTPS = true
        AMapServices.shared().apiKey = AMapKey
        
        let viewController = ViewController()
        viewController.title = "MainPage"
        let viewControllerB = BViewController()
        viewControllerB.title = "HistoryPage"
        let tabContrller = UITabBarController()
        tabContrller.viewControllers = [viewController, viewControllerB]
        window?.rootViewController = tabContrller
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        LocationDataSource.shared.save()
        print("applicationDidEnterBackground")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        
        // just print the speed of all data.
//        var i = 0
//        for model in LocationDataSource.shared.array {
//            print("\(i)=\(model.speed)\n")
//            i += 1
//        }
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

