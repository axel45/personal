//
//  ChatViewController.swift
//  20210411_tellApp
//
//  Created by 佐藤省吾 on 2021/06/13.
//

import UIKit
import MessageKit
import InputBarAccessoryView
import FirebaseFirestore

class ChatViewController: MessagesViewController, MessagesDataSource, MessageCellDelegate, MessagesLayoutDelegate, MessagesDisplayDelegate {
    
    let colors = Colors()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // UIViewでチャットのヘッダー部分を作成
        let uiView = UIView()
        uiView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 70)
        view.addSubview(uiView)
        
        // UILabelでヘッダーのタイトルを作成
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = colors.white
        // toDo firebaseからユーザー名を取得する
        label.text = "Doctor"
        label.frame = CGRect(x: 0, y: 20, width: view.frame.size.width, height: 40)
        // center.x プロパティはパーツの中心のx座標をセット
        label.center.x = view.center.x
        // textAlignment プロパティは文字の「左寄せ、中央よせ、右寄せ」を選択。.centerは中央よせ
        label.textAlignment = .center
        uiView.addSubview(label)
        
        // UIButtonで戻るボタンを作成
        // .system を指定する事で、ボタンとしての簡易的な機能を標準で持たせる
        let backButton = UIButton(type: .system)
        backButton.frame = CGRect(x: 10, y: 30, width: view.frame.size.width, height: 70)
        backButton.setImage(UIImage(named: "back"), for: .normal)
        // tintColor プロパティで設定した画像の色を変更できる
        backButton.tintColor = colors.white
        // ボタンサイズを設定
        backButton.titleLabel?.font = .systemFont(ofSize: 20)
        // .touchUpInside を設定して、指を離した時に発火させる。
        backButton.addTarget(self, action:  #selector(backButtonAction), for: .touchUpInside)
        uiView.addSubview(backButton)
        
        //
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 70)
        gradientLayer.colors = [colors.bluePerple.cgColor, colors.blue.cgColor]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        uiView.layer.insertSublayer(gradientLayer, at: 1)
    }
    
    @objc func backButtonAction() {
        // dismiss は画面を閉じる関数。トップ画面に戻す処理。
        dismiss(animated: true, completion: nil)
    }
    
    func currentSender() -> SenderType {
        <#code#>
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        <#code#>
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        <#code#>
    }
}

extension ChatViewController: InputBarAccessoryViewDelegate {
}
