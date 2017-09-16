//
//  ViewController.swift
//  3DTouch
//
//  Created by X on 2017/9/17.
//  Copyright © 2017年 ~X~. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel();
        
        label.text = "Joyce"
    
        label.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        
        label.backgroundColor = UIColor.red
        
        self.view.addSubview(label)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

