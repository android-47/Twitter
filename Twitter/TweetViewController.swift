//
//  TweetViewController.swift
//  Twitter
//
//  Created by Javier Garcia on 10/16/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var tweetTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tweetTextView.becomeFirstResponder()
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func tweet(_ sender: Any) {
        print ("tweettextview.textIS EMPTY: ", !tweetTextView.text.isEmpty)
        if (!tweetTextView.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print ("FAILED HERE--------------------------------------------------------------------------------------------")
                print ("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    

    
    
    

}
