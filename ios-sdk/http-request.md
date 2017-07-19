## **Creating a simple one table database with Core Data in iOS 10 using Swift 3.1**

Now that we are able to make a simple GET request using a 3rd party api in [playgrounds](https://github.com/dwyl/learn-apple-watch-development/issues/34),
we'll implement this in a very simple app which will display some of the information we've fetched onto the view controller alongside being able to send a POST request.

For this to work we need to install an npm module called json-server using the following command `npm i -g json-server`. If you are unsure of what npm is, I'd highly recommend [reading though](https://www.npmjs.com/) and installing it on your local machine

### json-server

json-server will let us create our very own api which we will be able to access from our app! It is very easy to set up.

1. Install json-server - `npm -i g json-server`
2. create a db.json file in a given directory (e.g. on your desktop)
3. add the following json:
```
{
  "store": [
    {
      "id": 0,
      "ios": {
        "project_name": "iOS",
        "total_time": 0,
        "color": "blue"
      }
    },
    {
      "id": 1,
      "elm": {
        "project_name": "elm",
        "total_time": 0,
        "color": "blue"
      }
    }
  ]
}
```
4. This will be our local database
5. run the server by running this following command in the terminal `json-server db.json`
6. Our API is up and running and ready to be used! :tada:
7. As an example you can type the following curl command in the terminal to see what the api responds with `curl localhost:3000/db`, the response will be the json that is found within db.json file.


### Making a GET request and displaying some data on the view controller

- Lets create a new single page app.

<img width="701" alt="screen shot 2017-06-02 at 11 47 30" src="https://cloud.githubusercontent.com/assets/2305591/26790674/73714758-4a0c-11e7-962f-5a534fff15cf.png">

- Create a simple layout by adding 2 buttons (GET & POST) and a label to the storyboard

<img width="232" alt="screen shot 2017-06-02 at 11 50 42" src="https://cloud.githubusercontent.com/assets/2305591/26790673/73700c12-4a0c-11e7-8fbc-b771651fc9f8.png">

- Create an outlet for the label and actions for the two buttons inside the viewController.swift file

<img width="701" alt="screen shot 2017-06-05 at 16 40 14" src="https://cloud.githubusercontent.com/assets/2305591/26791010/b3c5b9a0-4a0d-11e7-9cac-58c8c20715d5.png">

- One last thing to do is to allow the app to communicate via http. Now that we have the basic setup ready, we can create the GET request. In the info.plist add a key called `App Transport Security Settings` and then add another row with the following key `Allow Arbitrary Loads` which should be set to a BOOLEAN `YES`

<img width="701" alt="screen shot 2017-06-05 at 16 44 53" src="https://cloud.githubusercontent.com/assets/2305591/26791296/868102fa-4a0e-11e7-9046-2ffe7897ed60.png">

You are now all ready and set to make your GET request. :tada:

We want to be able to see some text when the user presses the `GET` button. For this we need to make a http request to our server that we've setup and then display some part of that information.

```

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

```
In the above piece of code, we are making a request to the local json-server and then once we've fetched the data we are displaying an id.

Now that we've set this up we can build and run it on a simulator to test this out. When you press the 'GET' button we will see the label change! :tada:

### Making a POST request to json-server

Now lets make a post request to the json-server so that we can save some data, please note that we'll use some hard coded json to send over in the post request.

```

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
                guard let data = data, error == nil else {   
                    // check for fundamental networking error
                    print("error=\(error)")
                    return
                }

                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           
                    // check for http errors
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

```


Here are the most important differences that you'll see in the code for POST request.
- setting the `httpMethod = "POST"`
- Set the body to the serialised JSON.
- Most importantly you'll need to set the content-type to `application/json` This took us a little while to figure out as you can see in this [Stack Overflow issue](https://stackoverflow.com/questions/44368070/dictionary-to-json-being-serialised-twice-in-swift-3)

The result of this POST request leads to the data being stored in json-server!


So there we have it, we've now made a GET and POST request URLSession alongside serialized JSON using JSONSerialization.

Hope you enjoyed this short tutorial, we would love some feedback! Please raise this as an issue in this [repo](https://github.com/dwyl/learn-apple-watch-development/issues/new). :tada:

**If you've come across any issues and are unable to get your code up and running then here is the [link to the XCode project](resources/http-requests) for this Tutorial.**
