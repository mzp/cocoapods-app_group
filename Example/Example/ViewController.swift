//
//  ViewController.swift
//  Example
//
//  Created by mzp on 9/21/15.
//  Copyright © 2015 mzp. All rights reserved.
//

import UIKit
import AppGroup

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("%@", AppGroup.appGroupID())
        AppGroup.userDefaults().set(42, forKey: "answer")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

