//
//  ViewController2.swift
//  PlayMusic
//
//  Created by Lâm Nguyễn on 11/27/20.
//  Copyright © 2020 Lâm Nguyễn. All rights reserved.
//

import UIKit
import WebKit

class OnlineMusicViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var myWebView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myWebView.navigationDelegate = self
        let urlWeb = URL(string: "https://nhachot.vn/")
        let request = URLRequest(url: urlWeb!)
        myWebView.load(request)
    }

    @IBAction func back_Clicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
