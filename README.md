# YourSSU_incubating



### 첫번째 과제 - 계산기 어플리케이션 개발
____



**사용한 문법 정리**
1. TextFiled의 값 가져오기 : @IBOutlet
```
    @IBOutlet weak var Num1: UITextField! 
    @IBOutlet weak var Num2: UITextField!
    @IBOutlet weak var resultText: UILabel!
```
- ```@IBOutlet``` : 객체를 소스코드로 참조하기 위해서 사용하는 키워드, 속성이 변경되어야하는 경우 사용됨. 

- ```weak var```: 시스템 내부에서 자체적으로 메모리에 제거할 수 있음 

2. 액션 함수 추가
```
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
```

- ```@IBAction``` : 액션 함수, 객체의 이벤트를 제어하기 위해 사용하는 키워드 
