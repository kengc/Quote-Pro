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
    
//    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivityType) -> Any? {
//        
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // image to share
        //let image = UIImage(named: "Image")
        
        
        let myWebsite = NSURL(string:"http://www.google.com/")
        //let myWebsite = NSURL(string:"blah blah blah")
        let img: UIImage = images[indexPath.row]
        
//        guard let url = myWebsite else {
//            print("nothing found")
//            return
//        }
        //iMessage/Facebook/Twitter
        
        let shareItems:Array = [img, myWebsite] as [Any]
        
        let activityViewController:UIActivityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        
        activityViewController.excludedActivityTypes = []
//        activityViewController.excludedActivityTypes = [UIActivityType.print, UIActivityType.postToWeibo, UIActivityType.copyToPasteboard, UIActivityType.addToReadingList, UIActivityType.postToVimeo]
        
    
        self.present(activityViewController, animated: true, completion: nil)

        
        
        // set up activity view controller
        //iMessage/Facebook/Twitter.
        
//        let activityViewController = UIActivityViewController(activityItems: [images[indexPath.row]], applicationActivities: nil)
//        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
//        
//        // exclude some activity types from the list (optional)
//        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
//        
//        // present the view controller
//        self.present(activityViewController, animated: true, completion: nil)
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

