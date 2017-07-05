//
//  QuoteViewController.swift
//  QuotePro
//
//  Created by Kevin Cleathero on 2017-07-04.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

import UIKit

class QuoteViewController : UIViewController {

    override func viewDidLoad() {
       
        NotificationCenter.default.addObserver(self, selector: #selector(QuoteViewController.methodOfReceivedNotification(notification:)), name: Notification.Name("dismissXib"), object: nil)
        
        if let objects = Bundle.main.loadNibNamed("xibView", owner: nil, options: [:]),
            let viewXib = objects.first {
            
           // self.view.addSubview(viewXib as! UIView)
            self.view = viewXib as! UIView
            // set up view in view hierarchy
            
        }

    }

    
    func methodOfReceivedNotification(notification: Notification){
        //Take Action on Notification
       self.navigationController?.popToRootViewController(animated: true)
    }
}
