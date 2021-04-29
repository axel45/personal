//
//  ViewController.swift
//  20210411_tellApp
//
//  Created by 佐藤省吾 on 2021/04/11.
//

import UIKit

class ViewController: UIViewController, SideMenuDelegate {
    
    var sideView : SideMenu!
    @IBOutlet var LeftEdgePanGesture: UIScreenEdgePanGestureRecognizer!
    let colors = Colors()

    override func viewDidLoad() {
        super.viewDidLoad()
        let viewWidth = view.frame.size.width
        let viewHeight = view.frame.size.height
        // Do any additional setup after loading the view.
        view.backgroundColor = colors.pink
        
        // SideMenu のインスタンス作成。最初は画面外に配置しておくことで、スワイプして表示できるようにする。
        let imgageArray = [UIImage(named:"home.png")!, UIImage(named:"chat.png")!, UIImage(named:"avatar.png")!]
        sideView = SideMenu(image:imgageArray, parentViewController:self)
        self.view.addSubview(sideView)
        
        // 左からスワイプしてメニューを表示
        LeftEdgePanGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(EdgePanGesture(_:)))
        LeftEdgePanGesture.edges = .right
        
        //追加
        sideView.delegate = self
        
        let uiView_relative = UIView()
        uiView_relative.frame.size = CGSize(width: 50, height: 50)
        uiView_relative.center = CGPoint(x: viewWidth / 2, y: viewHeight / 2)
        uiView_relative.backgroundColor = UIColor.systemGray
        view.addSubview(uiView_relative)
    }
    // デリゲートメソッド
    func onClickButton(sender: UIButton) {
         //処理
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
