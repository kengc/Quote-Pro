//
//  ViewController.swift
//  QuotePro
//
//  Created by Kevin Cleathero on 2017-07-04.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITabBarDelegate, UITableViewDataSource, XibQuoteViewProtocol {

    @IBOutlet var tableView: UITableView!

    
    var photoObject: PhotoModel?
    var quoteObject: QuoteModel?

    var photos = [PhotoModel]()
    var quotes = [QuoteModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        
//        let delegateView = XibQuoteView()
//        delegateView.XibQuoteViewDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "quoteCell"
        
        //The guard let expression safely unwraps the optional.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            as? CustomQuoteCell else{
                
                fatalError("The dequeued cell is not an instance of MealTableViewCell")
        }

        let photoObject = photos[indexPath.row]
        let quoteObject = quotes[indexPath.row]
        
        cell.authorLabel.text = quoteObject.author
        cell.quoteLabel.text = quoteObject.quote
        cell.imageViewCell.image = photoObject.quoteImage
        
        return cell
    }
    
    @IBAction func addQuoteAction(_ sender: UIBarButtonItem) {
            self.performSegue(withIdentifier: "showQuoteView", sender: self)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "showQuoteView" {
          let nextScene = segue.destination as? QuoteViewController
           let canView = nextScene?.view as? XibQuoteView
           //let xibView = nextScene?.view.subviews[1] as? XibQuoteView
            canView?.XibQuoteViewDelegate = self

        }
    }
    
    func saveQuote(photo: PhotoModel, quote: QuoteModel) {
        photos.append(photo)
        quotes.append(quote)
        self.tableView.reloadData()
    }
    
}

