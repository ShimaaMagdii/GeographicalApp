//
//  GAWebViewController.swift
//  GeographicalApp
//
//  Created by Shimaa Magdi on 2/10/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit

/**
 *  GA Web View Controller opens location url.
 */
class GAWebViewController: GABaseController {
    var urlStr: String?
    @IBOutlet weak var webView: UIWebView!
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        if let urlStr = urlStr, let url = URL(string: urlStr) {
            let requestObj = URLRequest(url: url)
            webView.loadRequest(requestObj)
        }
        
    }
}

