//
//  AppDelegate.swift
//  ClockTabBar
//
//  Created by Hoàng Loan on 12/12/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vcClock = storyboard.instantiateViewController(withIdentifier: "ClockViewController")
        let vcStopwatch = storyboard.instantiateViewController(withIdentifier: "StopwatchViewController")
        
        let tapbarController = UITabBarController()
        tapbarController.viewControllers = [vcClock, vcStopwatch]
        
        window?.makeKeyAndVisible()
        window?.rootViewController = tapbarController
        
        return true
    }
}

