//
//  ViewController.swift
//  Calculator
//
//  Created by 지희의 MAC on 2023/03/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let firstInputTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "첫번째 숫자를 입력해주세요"
        textField.backgroundColor = .systemGray6
        textField.keyboardType = UIKeyboardType.numberPad
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        
        return textField
    }()
    let secondInputTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "두번째 숫자를 입력해주세요"
        textField.backgroundColor = .systemGray6
        textField.keyboardType = UIKeyboardType.numberPad
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        
        return textField
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "버튼을 눌러주세요"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let plusButton : UIButton = {
        let button = UIButton()
            
        button.setTitle("더하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemTeal
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
            
        return button
    }()
    
    let minusButton : UIButton = {
        let button = UIButton()
            
        button.setTitle("빼기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemTeal
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
            
        return button
    }()
    
    let multipleButton : UIButton = {
        let button = UIButton()
            
        button.setTitle("곱하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemTeal
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
            
        return button
    }()
    let dividedButton : UIButton = {
        let button = UIButton()
            
        button.setTitle("나누기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemTeal
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
            
        return button
    }()
    
    let sameComponentmargin = 10
    let diffComponentmargin = 20
    let leadingTrailingMargin = 47

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayouts()
        registerTarget()
    }
    
    private func setLayouts() {
            setViewHierarchy()
            setConstraints()
    }
    
    private func setViewHierarchy(){
        view.addSubview(firstInputTextField)
        view.addSubview(secondInputTextField)
        view.addSubview(resultLabel)
        view.addSubview(plusButton)
        view.addSubview(minusButton)
        view.addSubview(multipleButton)
        view.addSubview(dividedButton)
    }
    
    private func setConstraints(){
        let safeArea = view.safeAreaLayoutGuide
        
        firstInputTextField.snp.makeConstraints{
            $0.top.equalTo(safeArea).offset(157)
            $0.leading.trailing.equalTo(safeArea).inset(leadingTrailingMargin)
            
        }
        
        secondInputTextField.snp.makeConstraints{
            $0.top.equalTo(firstInputTextField.snp.bottom).offset(sameComponentmargin)
            $0.leading.trailing.equalTo(safeArea).inset(leadingTrailingMargin)
        }
        
        resultLabel.snp.makeConstraints{
            $0.top.equalTo(secondInputTextField.snp.bottom).offset(diffComponentmargin)
            $0.leading.trailing.equalTo(safeArea).inset(leadingTrailingMargin)
        }
        
        plusButton.snp.makeConstraints{
            $0.top.equalTo(resultLabel.snp.bottom).offset(diffComponentmargin)
            $0.leading.trailing.equalTo(safeArea).inset(leadingTrailingMargin)
        }
        
        minusButton.snp.makeConstraints{
            $0.top.equalTo(plusButton.snp.bottom).offset(sameComponentmargin)
            $0.leading.trailing.equalTo(safeArea).inset(leadingTrailingMargin)
        }
        
        multipleButton.snp.makeConstraints{
            $0.top.equalTo(minusButton.snp.bottom).offset(sameComponentmargin)
            $0.leading.trailing.equalTo(safeArea).inset(leadingTrailingMargin)
        }
        
        dividedButton.snp.makeConstraints{
            $0.top.equalTo(multipleButton.snp.bottom).offset(sameComponentmargin)
            $0.leading.trailing.equalTo(safeArea).inset(leadingTrailingMargin)
        }
        
                
    }
    
    private func registerTarget() {
           [plusButton, minusButton, multipleButton, dividedButton].forEach {
               $0.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
           }
       }
    
    @objc func buttonDidTap(_ button: UIButton) throws {
        var resultText = ""
        do{
            guard let text1 = firstInputTextField.text, let text2 = secondInputTextField.text else{
                throw ErrorMessage.unknown
            }
            
            if text1.isEmpty || text2.isEmpty {
                throw ErrorMessage.emptyInput
            }
            
            guard let num1 = Int(text1), let num2 = Int(text2) else {
                throw ErrorMessage.invaildInput
            }
            switch button{
            case plusButton:
                resultText = "\(num1)+\(num2) = \(num1+num2)"
            case minusButton:
                resultText = "\(num1)-\(num2) = \(num1-num2)"
            case multipleButton:
                resultText = "\(num1)X\(num2) = \(num1*num2)"
            case dividedButton:
                if num1 == 0 {throw ErrorMessage.divideByZero}
                resultText = "\(num1)/\(num2) = \(num1/num2)"
            default:
                throw ErrorMessage.unknown
            }
            
        }
            catch ErrorMessage.unknown {
               resultText = ErrorMessage.unknown.rawValue
            } catch ErrorMessage.emptyInput {
                resultText = ErrorMessage.emptyInput.rawValue
            } catch ErrorMessage.invaildInput {
                resultText = ErrorMessage.invaildInput.rawValue
            } catch ErrorMessage.divideByZero {
                resultText = ErrorMessage.divideByZero.rawValue
            }
        resultLabel.text = resultText
        
    }
    
    enum ErrorMessage: String, Error{
        case emptyInput = "숫자를 모두 입력해주세요"
        case invaildInput = "올바르지 않은 입력입니다."
        case divideByZero = "0은 나눌 수 없습니다."
        case unknown = "알 수 없는 오류입니다."
    }


}

