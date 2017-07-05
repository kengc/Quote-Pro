//
//  URLDataHelper.swift
//  QuotePro
//
//  Created by Kevin Cleathero on 2017-07-04.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

import UIKit

class URLDataHelper: NSObject {

    class func fetchQuote(closure: @escaping (_ author: String, _ quote: String) -> Void ){

        let urlstring = "https://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json"
        
        let url = URL(string: urlstring)!
        
        print(url as Any)
        
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) -> Void in
    
            // convert Data to JSON
            if let jsonUnformatted = try? JSONSerialization.jsonObject(with: data!, options: []) {
                
                
                //value is AnyObject (can be either a dictionary, array, string or a number)
                let json = jsonUnformatted as? [String: AnyObject]
            
                
                OperationQueue.main.addOperation {
                    //if let here and throw error
                    let quote = json?["quoteText"] as? String
                    let author = json?["quoteAuthor"] as? String
                    
                    closure(author!, quote!)
                }
            }
            
            else{
                print("error with response data")
            }
            
        })
        // this is called to start (or restart, if needed) our task
        task.resume()
        
        print ("outside dataTaskWithURL")
        
    }

    class func fetchImage(closure: @escaping (_ image: UIImage) -> Void ){
        
        //let imageID : String = self.photoObject.imageID! as String
        let urlstring = "https://lorempixel.com/400/200/"
        
        let url = URL(string: urlstring)!
        
        print(url as Any)
        
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) -> Void in
            
            OperationQueue.main.addOperation {
                //labelView.text = "Number of Views: " + views!
                //print(quoteObject as Any)
                //photoObject.quoteImage = UIImage(data: data)!
                if let imageData = data as NSData? {
                    let image = UIImage(data: imageData as Data)
                    closure(image!)
                }
                
            }
            
        })
        // this is called to start (or restart, if needed) our task
        task.resume()
        
        print ("outside dataTaskWithURL")
        
    }

}
