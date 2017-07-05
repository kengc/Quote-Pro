//
//  ViewController.swift
//  QuotePro
//
//  Created by Kevin Cleathero on 2017-07-04.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "quoteCell"
        
        //The guard let expression safely unwraps the optional.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            as? CustomQuoteCell else{
                
                fatalError("The dequeued cell is not an instance of MealTableViewCell")
        }

        return cell
    }
    
    @IBAction func addQuoteAction(_ sender: UIBarButtonItem) {
            self.performSegue(withIdentifier: "showQuoteView", sender: self)
        }
    
}

