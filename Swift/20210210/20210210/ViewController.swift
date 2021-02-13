//
//  ViewController.swift
//  20210210
//
//  Created by 佐藤省吾 on 2021/02/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let uiView = UIView()
        uiView.frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        uiView.backgroundColor = UIColor.systemBlue
        view.addSubview(uiView)
    }


}

