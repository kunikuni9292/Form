//
//  ViewController.swift
//  Form
//
//  Created by 崎原邦達 on 2020/12/06.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{
    //名前テキストフィールド
    @IBOutlet weak var nameTextField: UITextField!
    //電話番号テキストフィールド
    @IBOutlet weak var phoneTextField: UITextField!
    //メールアドレス　キストフィールド
    @IBOutlet weak var emailTextField: UITextField!
    //パスワード　キストフィールド
    @IBOutlet weak var passwordTextField: UITextField!
    //日付ピッカー
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onClickResultButton(_ sender: UIButton) {
        //入力画面
        let resultViewController = storyboard?.instantiateViewController(identifier: Define.SB_KEY_RESULT)as!ResultViewController
        resultViewController.name = nameTextField.text!
        resultViewController.phone = phoneTextField.text!
        resultViewController.mail = phoneTextField.text!
        resultViewController.password = passwordTextField.text!
        resultViewController.year = Calendar(identifier: .gregorian).component(.year, from: datePicker.date)
        resultViewController.month = Calendar(identifier: .gregorian).component(.month, from: datePicker.date)
        resultViewController.day = Calendar(identifier: .gregorian).component(.day, from: datePicker.date)
        navigationController?.pushViewController(resultViewController, animated: true)
    }
    
   //キーボード操作について
    //returnボタンが押されたとき
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //キーボードを閉じる
        textField.resignFirstResponder()
    }
    //画面がタップされたとき
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //キーボードを閉じる
        view.endEditing(true)
    }
}

