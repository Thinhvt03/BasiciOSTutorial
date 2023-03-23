//
//  AppDelegate.swift
//  TabMenu
//
//  Created by Hoàng Loan on 22/12/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc1 = UIViewController()
        let vc2 = UIViewController()
        let vc3 = UIViewController()
        
        vc1.title = "First"
        vc2.title = "Secound"
        vc3.title = "Thirt"
        
        vc1.view.backgroundColor = .red
        vc2.view.backgroundColor = .cyan
        vc3.view.backgroundColor = .blue
        
        let menuViewController = MenuViewController(nibName: "MenuViewController", bundle: nil)
        menuViewController.viewControllers = [vc1, vc2, vc3]
        
        window?.rootViewController = menuViewController
        window?.makeKeyAndVisible()
        
        return true
    }

    
}

