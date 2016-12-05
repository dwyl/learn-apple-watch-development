//
//  ViewController.swift
//  v0.1
//
//  Created by Sohil Pandya on 02/12/2016.
//  Copyright © 2016 Sohil Pandya. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {

    
    
    public func sessionDidDeactivate(_ session: WCSession) {
        // Code
    }
    public func sessionDidBecomeInactive(_ session: WCSession) {
        // Code
    }
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        // Dummy Implementation
    }
    
    @IBOutlet weak var clickedLabel: UILabel!

    fileprivate let session: WCSession? = WCSession.isSupported() ? WCSession.default() : nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        session?.delegate = self
        session?.activate()
    }

    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        
        DispatchQueue.main.async {
            print("Yes")
            self.clickedLabel.text = "Watch Click"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func phoneButtonClicked(_ sender: UIButton) {
        self.clickedLabel.text = "Phone Click"
        print("clicked on Phone")
        
    }
    

}

