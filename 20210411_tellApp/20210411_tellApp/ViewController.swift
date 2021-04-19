//
//  ViewController.swift
//  20210411_tellApp
//
//  Created by 佐藤省吾 on 2021/04/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var LeftEdgePanGesture: UIScreenEdgePanGestureRecognizer!
    let colors = Colors()
    var sideView : SideMenu!

    override func viewDidLoad() {
        super.viewDidLoad()
        let viewWidth = view.frame.size.width
        let viewHeight = view.frame.size.height
        // Do any additional setup after loading the view.
        view.backgroundColor = colors.pink
        
        // SideMenu のインスタンス作成。最初は画面外に配置しておくことで、スワイプして表示できるようにする。
        let imgageArray = [UIImage(named:"0.png")!, UIImage(named:"1.png")!, UIImage(named:"2.png")!]
        sideView = SideMenu(image:imgageArray, parentViewController:self)
        self.view.addSubview(sideView)
        
        // 左からスワイプしてメニューを表示
        LeftEdgePanGesture.edges = .left
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    // スワイプを検出したときの挙動
    @IBAction func EdgePanGesture(_ sender: UIScreenEdgePanGestureRecognizer) {
        sideView.getEdgeGesture(sender: sender)
    }
}

