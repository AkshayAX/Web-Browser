//
//  ViewController.swift
//  browse2
//
//  Created by Akshaya Kumar N on 3/8/19.
//  Copyright © 2019 Akshaya Kumar N. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var web: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        web.allowsBackForwardNavigationGestures = true
        let refresh = UIRefreshControl()
        refresh.addTarget(self , action: #selector(refreshModule(sender:)), for: UIControl.Event.valueChanged)
        web.scrollView.bounces = true
        web.scrollView.addSubview(refresh)
        let url = URL(string: "https://www.google.com")
        let request = URLRequest(url: url!)
        web.load(request)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
 @objc func refreshModule(sender:UIRefreshControl)
    {
        web.reload()
        print("reloading")
        sender.endRefreshing()
        
    }

    @IBAction func forward(_ sender: Any) {
        web.goForward()
    }
    @IBAction func backward(_ sender: Any) {
        web.goBack()
    }
    
    @IBAction func reload(_ sender: Any) {
        web.reload()
    }
}

