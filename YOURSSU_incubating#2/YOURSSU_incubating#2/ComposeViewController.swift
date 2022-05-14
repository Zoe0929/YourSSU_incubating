//
//  ComposeViewController.swift
//  YOURSSU_incubating#2
//
//  Created by 지희의 MAC on 2022/05/09.
//

import UIKit
 




let textViewPlaceHolder = "내용 입력"
class ComposeViewController: UIViewController {

 

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var memoTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memoTextView.delegate=self
        //
        titleTextField.placeholder="제목 입력"
        memoTextView.text=textViewPlaceHolder
        
        
        
        

        // Do any additional setup after loading the view.
    }
    //close버튼 동작
//    @IBAction func Close(_ sender: Any) {
//        [self .dismiss(animated: true, completion: nil)];
//    }
    
    //save 버튼 동작
    @IBAction func save(_ sender: Any) {
        let title = titleTextField.text
        let memo = memoTextView.text
        let newMemo = Memo(title: title ?? "기본제목" , content: memo ?? "기본내용"   )
        MemoList.shared.dummyMemoList.append(newMemo)
        //델리게이트, 노티피케이션 센터 이용해서 데이터 넘겨주기
        NotificationCenter.default.post(name: ComposeViewController.newMemoDisInsert, object: nil)
        //화면 전환 방법이 present -> push 로 바뀌었으니 뒤로 가는 방법도 바뀜!(pop 이용)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ComposeViewController{
    static let newMemoDisInsert = Notification.Name(rawValue: "newMemoDidInsert")
}

extension ComposeViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == textViewPlaceHolder {
            textView.text = nil
            textView.textColor = .black
        }
        
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = textViewPlaceHolder
            textView.textColor = .lightGray
        }
    }

}
