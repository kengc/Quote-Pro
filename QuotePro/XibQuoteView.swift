//
//  XibQuoteView.swift
//  QuotePro
//
//  Created by Kevin Cleathero on 2017-07-05.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

import UIKit

class XibQuoteView: UIView {


    @IBOutlet var quoteLabel: UILabel!
    
    
    @IBOutlet var imageView: UIImageView!
    

    @IBOutlet var authorLabel: UILabel!
//        
//    @IBOutlet var quoteLabelXib: UILabel!
//
//    @IBOutlet var iamgeViewXib: UIImageView!
//    
//    @IBOutlet var authorLabelXib: UILabel!
//    
//    
//    @IBOutlet var somelabel: UILabel!
    
    var photoObject = PhotoModel()
//    var quoteObject = QuoteModel()

    

//    override func viewDidAppear(_ animated: Bool) {
//        quoteLabel.numberOfLines = 0;
//    }
    
//    
//    func populateQuoteLabel(){
//        quoteLabelXib.numberOfLines = 0;
//        quoteLabelXib.text = quoteObject.quote
//        authorLabelXib.text = quoteObject.author
//    }
//    
//    func populateImageView(){
//        iamgeViewXib.image = photoObject.quoteImage
//    }
//    
//    @IBAction func quoteAction(_ sender: UIButton) {
//        URLDataHelper.fetchQuote() { (author, quote) in
//            self.quoteObject.quote = quote
//            self.quoteObject.author = author
//           // self.populateQuoteLabel()
//        }
//
//    }
//    
//    
    @IBAction func imageAction(_ sender: UIButton) {
        URLDataHelper.fetchImage { (image) in
            self.photoObject.quoteImage = image
           // self.populateImageView()
        }
    }
 
//
//    @IBAction func saveAction(_ sender: UIButton) {
//    }
 
    
}
