//
//  ViewController.swift
//  YOURSSU_incubating#1
//
//  Created by 지희의 MAC on 2022/04/13.
//

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var num1TextField: UITextField!
    @IBOutlet weak var num2TextField: UITextField!
    @IBOutlet weak var resultText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpOpButton(_ sender: UIButton)
    {
        if let num1 =  num1TextField.text, let num2 =  num2TextField.text {
            
            if num1.isEmpty || num2.isEmpty {
                resultText.text = "값을 모두 입력해주세요."
            }
            else if let num1int = Int(num1), let num2int = Int(num2){
//                resultText.text="\(buttonId.tag)"
                switch sender.tag{
                case 0:
                    resultText.text="\(num1)+\(num2)=\(num1int+num2int)"
                case 1:
                    resultText.text="\(num1)-\(num2)=\(num1int-num2int)"
                case 2:
                    if(num2int==0){
                        resultText.text="0으로는 나눌 수 없습니다."
                    }
                    else{
                        resultText.text="\(num1)/\(num2)=\(num1int/num2int)"
                    }
                case 3:
                    resultText.text="\(num1)*\(num2)=\(num1int*num2int)"
                default:
                    return
                }
            }
            else {
                resultText.text="잘못된 값입니다."
            }
        }
    }
}

