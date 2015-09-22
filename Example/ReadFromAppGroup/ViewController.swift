//
//  ViewController.swift
//  ReadFromAppGroup
//
//  Created by mzp on 9/22/15.
//  Copyright © 2015 mzp. All rights reserved.
//

import UIKit
import AppGroup

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("%@", AppGroup.appGroupID())
        NSLog("%d", AppGroup.userDefaults().integerForKey("answer"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

