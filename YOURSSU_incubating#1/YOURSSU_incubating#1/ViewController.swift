//
//  ViewController.swift
//  YOURSSU_incubating#1
//
//  Created by 지희의 MAC on 2022/04/13.
//

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var Num1: UITextField!
    @IBOutlet weak var Num2: UITextField!
    @IBOutlet weak var resultText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpPlusButton(_ sender: UIButton)
    {
        guard let num1 = Num1.text, let num2 = Num2.text else {
            return
        }
        var result = 0
        if let inum1 = Int(num1), let inum2=Int(num2) {
            result = inum1 + inum2
        }
        resultText.text="\(num1)+\(num2)=\(result)"
    }

    
    @IBAction func touchUpMinusButton(_ sender: UIButton)
    {
            guard let num1 = Num1.text, let num2 = Num2.text else {
                return
            }
            var result = 0
            if let inum1 = Int(num1), let inum2=Int(num2) {
                result = inum1 - inum2
            }
            resultText.text="\(num1)-\(num2)=\(result)"
    }
    
    @IBAction func touchUpMutiButton(_ sender: UIButton)
    {
                guard let num1 = Num1.text, let num2 = Num2.text else {
                    return
                }
                var result = 0
                if let inum1 = Int(num1), let inum2=Int(num2) {
                    result = inum1 * inum2
                }
                resultText.text="\(num1)*\(num2)=\(result)"
    }
    
    @IBAction func touchUpDivButton(_ sender: UIButton)
    {
                guard let num1 = Num1.text, let num2 = Num2.text else {
                    return
                }
                var result = 0
                if let inum1 = Int(num1), let inum2=Int(num2) {
                    result = inum1 / inum2
                }
                resultText.text="\(num1)/\(num2)=\(result)"
    }
    
    
    
    
}

