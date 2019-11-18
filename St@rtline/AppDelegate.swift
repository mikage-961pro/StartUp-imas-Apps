//
//  AppDelegate.swift
//  St@rtline
//
//
//  Created by Apple on 2019/08/23.
//  Copyright © 2019 Apple.inc All rights reserved.
//

import Cocoa
import WebKit
import NotificationCenter
import UserNotifications

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    

//    func applicationDidFinishLaunching(_ aNotification: Notification) {
//        // Insert code here to initialize your application
//    }
    
//        func applicationDidFinishLaunching(aNotification: NSNotification) {
//                // Insert code here to initialize your application
//
//            NSUserNotificationCenter.default.delegate = self as? NSUserNotificationCenterDelegate
//                let notification = NSUserNotification()
//                notification.title = "アイドルマスター シャイニーカラーズ"
//                notification.subtitle = "メンテナンスのお知らせ"
//                notification.informativeText = "2019年10月11日 12:00 ～ 2019年10月11日 15:00にてメンテナンスを実施いたします。メンテナンス中は「アイドルマスター シャイニーカラーズ」をご利用いただけません。"
//                //notification.contentImage =  NSImage(named: "blue")
//                notification.userInfo = ["title" : "タイトル"]
//                notification.deliveryDate = NSDate().addingTimeInterval(1.0) as Date
//                NSUserNotificationCenter.default.scheduleNotification(notification)
//                NSUserNotificationCenter.default.deliver(notification)
//            }

            func applicationWillTerminate(aNotification: NSNotification) {
                // Insert code here to tear down your application
            }
    
               
    
            func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
                 //    Update:アプリキルしてもアプリが残り続ける不具合を修正した
                return true
            }

            func userNotificationCenter(center: NSUserNotificationCenter, didActivateNotification notification: NSUserNotification) {
                let info = notification.userInfo as! [String:String]

                print(info["title"]!)
            }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func userNotificationCenter(_ center: NSUserNotificationCenter, shouldPresent notification: NSUserNotification) -> Bool {

        return true
    }
}
    




