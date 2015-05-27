//
//  AppDelegate.swift
//  WeiJuNews
//
//  Created by light on 15/5/23.
//  Copyright (c) 2015年 tuotuode. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        //创建窗口
        self.window = UIWindow()
        self.window?.frame = UIScreen.mainScreen().bounds
        //设置根控制器
        var tabbar = UITabBarController()
        self.window?.rootViewController = tabbar
        //设置tabbar的子控制器
        var vc1 = UIViewController()
        vc1.view.backgroundColor = UIColor.blueColor()
        vc1.tabBarItem.title = "首页"
        vc1.tabBarItem.image = UIImage(named: "tabbar_home")
        vc1.tabBarItem.selectedImage = UIImage(named: "tabbar_home_selected")
        var vc2 = UIViewController()
        vc2.view.backgroundColor = UIColor.redColor()
        vc2.tabBarItem.title = "消息"
        tabbar.viewControllers = [vc1,vc2]
       // tabbar.add
        //显示窗口
        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

