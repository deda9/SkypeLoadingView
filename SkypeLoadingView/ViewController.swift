//
//  ViewController.swift
//  SkypeLoadingView
//
//  Created by Bassem Qoulta on 1/3/19.
//  Copyright © 2019 Bassem Qoulta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.red
        let xview = SkypeLoadingView.default
        xview.frame.origin = CGPoint.init(x: (view.frame.width - xview.frame.width)/2, y: (view.frame.height - xview.frame.height)/2 )
        print(xview.frame)
        self.view.addSubview(xview)
    }
}

