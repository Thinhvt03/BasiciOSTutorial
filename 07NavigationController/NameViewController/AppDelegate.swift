//
//  AppDelegate.swift
//  NameViewController
//
//  Created by Hoàng Loan on 06/12/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainVC = ViewController()
        let navigationControl = UINavigationController(rootViewController: mainVC)
        window?.rootViewController = navigationControl
        window?.makeKeyAndVisible()
        
        return true
    }

}

