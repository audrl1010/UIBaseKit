//
//  AppDelegate.swift
//  UIBaseKit
//
//  Created by audrl1010 on 11/05/2017.
//  Copyright (c) 2017 audrl1010. All rights reserved.
//

import UIKit

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions
    launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    setupApplication(application)
    return true
  }
  
  func setupApplication(_ application: UIApplication) {
    window = {
      $0.rootViewController = SignUpViewController()
      $0.makeKeyAndVisible()
      return $0
    }(UIWindow(frame: UIScreen.main.bounds))
  }
}
