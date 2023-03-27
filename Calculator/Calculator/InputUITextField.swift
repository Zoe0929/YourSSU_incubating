//
//  InputUITextField.swift
//  Calculator
//
//  Created by 지희의 MAC on 2023/03/24.
//

import UIKit

class InputTextField: UITextField {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    init(_ text : String) {
        super.init(frame:CGRect.zero)
        self.placeholder = "\(text) 숫자를 입력해주세요"
        self.backgroundColor = .systemGray6
        self.keyboardType = UIKeyboardType.numberPad
        self.borderStyle = .roundedRect
        self.clearButtonMode = .always
        //그림자 설정
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.15
        self.layer.shadowRadius = 2
        
    }
    
}
