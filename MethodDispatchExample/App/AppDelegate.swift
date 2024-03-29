//
//  AppDelegate.swift
//  MethodDispatchExample
//
//  Created by Artem Mushtakov on 29.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = DirectDispathViewController()
        window?.makeKeyAndVisible()

        return true
    }
}
