//
//  XibQuoteView.swift
//  QuotePro
//
//  Created by Kevin Cleathero on 2017-07-05.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

import UIKit

protocol XibQuoteViewProtocol{
    func saveQuote(photo: PhotoModel, quote: QuoteModel)
}


class XibQuoteView: UIView {

    var XibQuoteViewDelegate:XibQuoteViewProtocol!
    
    @IBOutlet var quoteLabel: UILabel!
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var authorLabel: UILabel!

    
    var photoObject = PhotoModel()
    var quoteObject = QuoteModel()

    
    func populateQuoteLabel(){
        quoteLabel.numberOfLines = 0;
        quoteLabel.text = quoteObject.quote
        authorLabel.text = quoteObject.author
    }
    
    func populateImageView(){
        imageView.image = photoObject.quoteImage
    }
    
    @IBAction func quoteAction(_ sender: UIButton) {
        URLDataHelper.fetchQuote() { (author, quote) in
            self.quoteObject.quote = quote
            self.quoteObject.author = author
            self.populateQuoteLabel()
        }

    }
    
    
    @IBAction func imageAction(_ sender: UIButton) {
        URLDataHelper.fetchImage { (image) in
            self.photoObject.quoteImage = image
            self.populateImageView()
        }
    }
 

    @IBAction func saveAction(_ sender: UIButton) {
        
        self.XibQuoteViewDelegate.saveQuote(photo: self.photoObject, quote: self.quoteObject)
        
        NotificationCenter.default.post(name: Notification.Name("dismissXib"), object: nil)
 
    }
 
    
}
