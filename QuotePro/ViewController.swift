//
//  ViewController.swift
//  QuotePro
//
//  Created by Kevin Cleathero on 2017-07-04.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, XibQuoteViewProtocol {

    @IBOutlet var tableView: UITableView!

    
    var photoObject: PhotoModel?
    var quoteObject: QuoteModel?

    var photos = [PhotoModel]()
    var quotes = [QuoteModel]()
    var images = [UIImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
//MARK - Table View Delegate methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(photos.count)
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
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    
        let myWebsite = NSURL(string:"http://www.google.com/")
 
        let img: UIImage = images[indexPath.row]
        
   
        let shareItems:Array = [img, myWebsite] as [Any]
        
        let activityViewController:UIActivityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        
        activityViewController.excludedActivityTypes = []
        
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    

//MARK - Segue
    @IBAction func addQuoteAction(_ sender: UIBarButtonItem) {
            self.performSegue(withIdentifier: "showQuoteView", sender: self)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "showQuoteView" {
          let nextScene = segue.destination as? QuoteViewController
           let canView = nextScene?.view as? XibQuoteView
            canView?.XibQuoteViewDelegate = self

        }
    }
    
//MARK - XibQuoteView delegate
    func saveQuote(photo: PhotoModel, quote: QuoteModel, image: UIImage) {
        photos.append(photo)
        quotes.append(quote)
        images.append(image)
        print("inside saveQuote")
        self.tableView.reloadData()
    }

}

