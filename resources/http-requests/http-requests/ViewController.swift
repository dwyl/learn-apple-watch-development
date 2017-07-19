//
//  ViewController.swift
//  http-requests
//
//  Created by Sohil Pandya on 02/06/2017.
//  Copyright © 2017 learn-ios-development. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var getHTTP: UIButton!
    @IBOutlet weak var postHTTP: UIButton!
    @IBOutlet weak var textareaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func getHTTP(_ sender: UIButton) {
        
        let getURL = URL(string: "http://localhost:3000/db")!
        let urlSession = URLSession.shared
        let getRequest = URLRequest(url: getURL)
        
        let task = urlSession.dataTask(with: getRequest as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    if let j = json["store"] as? [NSDictionary] {
                        for store in j {
                            if let id = store["id"] as? Int {
                                print("I AM ID \(id)" )
                                // this http request is done on a background thread
                                // so if we were to set the text here then it will not update straight away
                                // as you are still on that background thread
                                // all UI work must be done on the main thread
                                // using dispathQueue.main.async
                                DispatchQueue.main.async {
                                    self.textareaLabel.text = "\(id)"
                                }
                            }
                        }
                    }
                }

            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
    
    @IBAction func postHTTP(_ sender: UIButton) {
        let store = [
            "newTask" : [
                "project_name": "iOS",
                "total_time":0,
                "color":"blue"
            ]
        ]
        do {
            let jsonData = try? JSONSerialization.data(withJSONObject: store, options: JSONSerialization.WritingOptions.prettyPrinted)

                var request = URLRequest(url: URL(string: "http://localhost:3000/store")!)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")

                request.httpMethod = "POST"
                request.httpBody = jsonData
                let task = URLSession.shared.dataTask(with: request) { data, response, error in
                    guard let data = data, error == nil else {                                                 // check for fundamental networking error
                        print("error=\(error)")
                        return
                    }
                    
                    if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                        print("statusCode should be 200, but is \(httpStatus.statusCode)")
                        print("response = \(response)")
                    }
                    
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                            print(json)
                            
                            DispatchQueue.main.async {
                                self.textareaLabel.text = "Post request sent successfully"
                            }
                        }
                    } catch let error {
                        print(error.localizedDescription)
                    }
                }
                task.resume()
        } catch {
            print(error.localizedDescription)
        }
    }
    

    


}

