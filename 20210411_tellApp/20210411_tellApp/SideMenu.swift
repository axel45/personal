//
//  SideMenu.swift
//  20210411_tellApp
//
//  Created by 佐藤省吾 on 2021/04/11.
//

import UIKit

class SideMenu: UIView {
    
    var clearView: UIView!
    // 親VCを取り出し
    let parentVC = self.parentViewController
    let colors = Colors()
    // サイドメニューのサイズ
    var size: CGRect
    
    // イニシャライザ
    init(image: [UIImage], parentViewController: UIViewController) {
        // bounds of entire screen in points
        self.size = CGRect(x: UIScreen.main.bounds.width, y: 0, width: UIScreen.main.bounds.width * 2, height: UIScreen.main.bounds.height)
        super.init(frame: size)
        self.backgroundColor = colors.skin
        self.alpha = 0.8
        self.buttonSet(num: image.count, image: image)
        // 親ViewController を指定
        //self.parentViewController() = parentViewController
        
        // メニュー以外の場所をタップしたときにメニューを下げる
        clearView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width * 2/3 , height: UIScreen.main.bounds.width))
        parentViewController.view.addSubView(clearView)
    }
    
    func parentViewController() -> UIViewController? {
        var parent: UIResponder? = self
        while let next = parent?.next {
            if let viewController = next as? UIViewController {
                return viewController
            }
            parent = next
        }
        return nil
    }
    
    required init?(coder aDecoder: NSCoder) {
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
    
    @objc internal func onClickButton(sender: UIButton) {

    }
    
    func getEdgeGesture(sender: UIScreenEdgePanGestureRecognizer) {
        // 移動量を取得
        let move:CGPoint = sender.translation(in: parentViewController()!.view)
        // 画面端からの移動量
        self.frame.origin.x += move.x
        // 画面表示を更新
        self.layoutIfNeeded()
        
        // ドラッグ終了時の処理
        if(sender.state == UIGestureRecognizer.State.ended) {
            if(self.frame.origin.x < UIScreen.main.bounds.width - parentViewController()!.view.frame.size.width/4) {
                // ドラッグの距離が画面幅の1/3を超えた場合はメニューを出す
                UIView.animate(withDuration: 0.8, animations: {
                    self.frame.origin.x = UIScreen.main.bounds.width * 2/3
                }, completion: nil)
                clearView.isHidden = false
            } else {
                // ドラッグの距離が画面幅の1/3以下の場合はそのままメニューを左に戻す
                UIView.animate(withDuration: 0.8, animations: {
                    self.frame.origin.x = UIScreen.main.bounds.width
                }, completion: nil)
            }
        }
        // 移動量をリセット
        sender.setTranslation(CGPoint.zero, in: parentViewController()!.view)
    }
}

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
