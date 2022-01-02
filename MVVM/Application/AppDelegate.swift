//
//  AppDelegate.swift
//  MVVM
//
//  Created by Amr Saeed on 27/12/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appDelegateManager: AppDelegateManager?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        appDelegateManager = AppDelegateManager()
        appDelegateManager?.start()
    
        return true
    }




}

