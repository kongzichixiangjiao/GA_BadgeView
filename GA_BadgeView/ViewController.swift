//
//  ViewController.swift
//  GA_BadgeView
//
//  Created by houjianan on 16/5/27.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.showBadgeView(rectOfBadgeView: CGRectMake(10, 10, 10, 10))
    }
}

