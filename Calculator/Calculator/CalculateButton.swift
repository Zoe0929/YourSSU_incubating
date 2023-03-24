//
//  CalculateUIButton.swift
//  Calculator
//
//  Created by 지희의 MAC on 2023/03/24.
//

import UIKit

class CalculateButton: UIButton {

    required init(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)!
       }
       
       override init(frame: CGRect){
           super.init(frame: frame)
       }
       
    init(_ text : String) {
           super.init(frame:CGRect.zero)
           self.setTitle("\(text)", for: .normal)
           self.setTitleColor(.white, for: .normal)
           self.backgroundColor = .systemTeal
           self.layer.cornerRadius = 15
           self.translatesAutoresizingMaskIntoConstraints = false
       }

}
