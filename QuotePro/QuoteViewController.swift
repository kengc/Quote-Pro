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
       
        if let objects = Bundle.main.loadNibNamed("xibView", owner: nil, options: [:]),
            let viewXib = objects.first {
            
            self.view.addSubview(viewXib as! UIView)
            // set up view in view hierarchy
            
        }

    }

}
