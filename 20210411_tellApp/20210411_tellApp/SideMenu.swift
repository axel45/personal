//
//  SideMenu.swift
//  20210411_tellApp
//
//  Created by 佐藤省吾 on 2021/04/11.
//

import UIKit
// メニューに配置したボタンを押したときの挙動はプロジェクトごとに異なるので、デリゲートを使ってボタンの挙動を他のクラスに委譲できるようにする
@objc protocol SideMenuDelegate {
    func onClickButton(sender:UIButton)
}

class SideMenu: UIView {
    // デリゲートのインスタンスを作成
    weak var delegate: SideMenuDelegate?
    var swipeGesture: UISwipeGestureRecognizer!
    var leftConstraint: NSLayoutConstraint!
    let colors = Colors()
    var parentVC: UIViewController!
    var isSideMenuhidden: Bool = true
    // サイドメニューのサイズ
    var size: CGRect?
    
    // イニシャライザ
    init(image: [UIImage], parentViewController: UIViewController) {
        // bounds of entire screen in points
        self.size = CGRect(x: UIScreen.main.bounds.width, y: 0, width: UIScreen.main.bounds.width * 2, height: UIScreen.main.bounds.height)
        super.init(frame: size!)
        self.backgroundColor = colors.skin
        self.alpha = 0.8
        self.buttonSet(num: image.count, image: image)
        // 親ViewController を指定
        self.parentVC = parentViewController

        // メニュー以外の場所をタップしたときにメニューを下げる
        let clearView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width * 2/3 , height: UIScreen.main.bounds.width))
        clearView.alpha = 1.0
        parentVC.view.addSubview(clearView)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.clearViewTapped))
        tapGesture.numberOfTapsRequired = 1
        clearView.isHidden = true
        clearView.addGestureRecognizer(tapGesture)
    }
        
    @objc func clearViewTapped() {
        if isSideMenuhidden == false {
            isSideMenuhidden = true
            UIView.animate(withDuration: 0.8, animations: {self.frame.origin.x = UIScreen.main.bounds.width}, completion: nil)
        }
    }
    
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    
    //親ビューで指定した画像の数だけボタンを生成、配置
    func buttonSet(num:Int, image:[UIImage]) {
        for i in 0..<num {
            let button = UIButton(frame: CGRect(x: 10, y: 50 + 110 * i, width: 90, height: 90))
            // ボタンの画像
            button.setImage(image[i], for: .normal)
            //ボタンの四隅に余白をつける
            button.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            // ボタンの背景色
            button.backgroundColor = colors.pink
            // 丸みをつける
            button.layer.cornerRadius = 45
            // ボタンにタグをつける
            button.tag = i
            // ボタンを押したときの動作
            button.addTarget(self, action: #selector(self.onClickButton(sender:)), for: .touchUpInside)
            self.addSubview(button)
        }
    }
    
    // デリゲートメソッド　親ビューコントローラーに委譲
    @objc func onClickButton(sender: UIButton) {
        self.delegate?.onClickButton(sender: sender)
    }
    
    public func getEdgeGesture(sender: UIScreenEdgePanGestureRecognizer) {
        self.translatesAutoresizingMaskIntoConstraints = false
        // 移動量を取得
        let move:CGPoint = sender.translation(in: parentVC.view)
        // 画面端からの移動量
        self.frame.origin.x += move.x
        // 画面表示を更新
        self.layoutIfNeeded()
        
        // ドラッグ終了時の処理
        if(sender.state == UIGestureRecognizer.State.ended) {
            if(self.frame.origin.x < UIScreen.main.bounds.width - parentVC.view.frame.size.width/3) {
                // ドラッグの距離が画面幅の1/3を超えた場合はメニューを出す
                UIView.animate(withDuration: 0.8, animations: {
                    self.frame.origin.x = UIScreen.main.bounds.width * 2/3
                }, completion: nil)
                isSideMenuhidden = false
            } else {
                // ドラッグの距離が画面幅の1/3以下の場合はそのままメニューを左に戻す
                UIView.animate(withDuration: 0.8, animations: {
                    self.frame.origin.x = UIScreen.main.bounds.width
                }, completion: nil)
            }
        }
        // 移動量をリセット
        sender.setTranslation(CGPoint.zero, in: parentVC.view)
    }
}
