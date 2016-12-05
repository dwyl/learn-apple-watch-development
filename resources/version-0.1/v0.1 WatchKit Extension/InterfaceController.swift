//
//  InterfaceController.swift
//  v0.1 WatchKit Extension
//
//  Created by Sohil Pandya on 02/12/2016.
//  Copyright © 2016 Sohil Pandya. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {
    
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        //Dummy Implementation
    }
    
    fileprivate let session: WCSession? = WCSession.isSupported() ? WCSession.default() : nil
    
    override init() {
        super.init()
        
        session?.delegate = self
        session?.activate()
    }
    
    @IBAction func buttonClicked() {
        print("Button Clicked by Sohil")
        
        let applicationData = ["counterValue" : 1]
        
        // The paired iPhone has to be connected via Bluetooth.
        if let session = session, session.isReachable {
            session.sendMessage(applicationData,
                                replyHandler: { replyData in
                                    // handle reply from iPhone app here
                                    print(replyData)
            }, errorHandler: { error in
                // catch any errors here
                print(error)
            })
        } else {
            // when the iPhone is not connected via Bluetooth
        }
    }

}
