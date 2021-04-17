//
//  Result.swift
//  Form
//
//  Created by 崎原邦達 on 2020/12/06.
//

import UIKit
import MessageUI


class ResultViewController: UIViewController,MFMailComposeViewControllerDelegate {
    
    //名前ラベル
    @IBOutlet weak var nameLabel: UILabel!
    //電話番号　ラベル
    @IBOutlet weak var phoneLabel: UILabel!
    //メールアドレス　ラベル
    @IBOutlet weak var emailLabel: UILabel!
    //パスワードラベル
    @IBOutlet weak var passwrodLabel: UILabel!
    //年齢　ラベル
    @IBOutlet weak var ageLabel: UILabel!
    //入れ物
//    var extras:Dictionary<String, Any> = Dictionary()
    
    var name = ""
    var phone = ""
    var mail = ""
    var password = ""
    var year = 0
    var month = 0
    var day = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameLabel.text = name
        phoneLabel.text = phone
        emailLabel.text = mail
        passwrodLabel.text = password
        ageLabel.text = "\(ConverterUtil.getAge(year: year, month: month, dayOfMonth: day))歳"
    }
    //送信ボタンアクション
    @IBAction func onClickSendBtn(_ sender: UIButton) {
        if !MFMailComposeViewController.canSendMail(){
            print("メッセージを送信できません！！")
            return
        }
        let sendMail = MFMailComposeViewController()
        sendMail.mailComposeDelegate = self //覚える定型文
        sendMail.setToRecipients(["kunitatsu427@gmail.com"]) //宛先
        sendMail.setSubject("プログラミングの授業")//件名
        let mailText = "名前：\(name)\n 電話番号：\(phone)\n パスワード：\(password)\n　歳：\(0)" //「\n」は改行という意味
        sendMail.setMessageBody(mailText, isHTML: false) //本文　mailtextを代入
        present(sendMail, animated: true, completion: nil) //mail送信
    }
    //メールアプリでアクションが完了したらポップアップを閉じる
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}

