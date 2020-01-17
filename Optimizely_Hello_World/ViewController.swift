//
//  ViewController.swift
//  Optimizely_Hello_World
//
//  Created by Kody O'Connell on 1/10/20.
//  Copyright © 2020 Kody O'Connell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let delegate = UIApplication.shared.delegate as! AppDelegate

    @IBAction func showMessage(sender: UIButton) {
        var enabled = false
        let userId = "user123"
        let attributes: [String: Any] = [
            "customerId": 123,   // Attributes used for targeted audience-based rollout
            "isVip": true,
        ]
        enabled = delegate.optimizely.isFeatureEnabled(featureKey: "hello_world", userId: userId, attributes: attributes)
        print("Feature is enabled? - \(enabled) for userId: \(userId)")
        
        let alertController = UIAlertController(title: "Alert", message: enabled ? "Hello World!" : "Nothing to see here...", preferredStyle: UIAlertController.Style.alert)
        
        if enabled {
            alertController.addAction(UIAlertAction(title: "Hello!", style: UIAlertAction.Style.default, handler: nil))
        } else {
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        }
        
        present(alertController, animated: true, completion: nil)
    }
}

