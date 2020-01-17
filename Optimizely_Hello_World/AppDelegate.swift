//
//  AppDelegate.swift
//  Optimizely_Hello_World
//
//  Created by Kody O'Connell on 1/10/20.
//  Copyright © 2020 Kody O'Connell. All rights reserved.
//

import UIKit
import Optimizely

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    // Build OptimizelyClient
    let optimizely = OptimizelyClient(sdkKey: "REPLACE_WITH_SDK_KEY", periodicDownloadInterval: 30)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        addListeners()
        optimizely.start { result in
            switch result {
            case .failure(let error):
             print("Optimizely SDK initiliazation failed: \(error)")
            case .success:
             print("Optimizely SDK initialized successfully!")
            }
        }
        return true
    }
    
    
    func addListeners() {
        let notificationCenter = optimizely.notificationCenter
            
            //notification fired when a value is returned by isFeatureEnabled function call
        _ = notificationCenter?.addDecisionNotificationListener(decisionListener: { (type, userId, attributes, decisionInfo) in
            print("Received decision notification: \(type) \(userId) \(String(describing: attributes)) \(decisionInfo)")
        })

            //notification fired when SDK polls for a new datafile and the datafile has changed
        _ = notificationCenter?.addDatafileChangeNotificationListener(datafileListener: { (_) in
            print("data file did change!")
        })
    }



}

