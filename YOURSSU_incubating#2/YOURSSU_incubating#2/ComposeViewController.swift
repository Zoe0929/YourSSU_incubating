//
//  ComposeViewController.swift
//  YOURSSU_incubating#2
//
//  Created by 지희의 MAC on 2022/05/09.
//

import UIKit
 





class ComposeViewController: UIViewController {

    
    @IBOutlet weak var memoTextView: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // UINavigationBar.appearance().barTintColor=UIColor.systemGray2

        // Do any additional setup after loading the view.
    }
    //close버튼 동작
    @IBAction func Close(_ sender: Any) {
        [self .dismiss(animated: true, completion: nil)];
    }
    
    //save 버튼 동작
    @IBAction func save(_ sender: Any) {
        let memo = memoTextView.text
        let newMemo = Memo(content: memo ?? "" )
        MemoList.dummyMemoList.append(newMemo)
        //델리게이트, 노티피케이션 센터 이용해서 데이터 넘겨주기
        NotificationCenter.default.post(name: ComposeViewController.newMemoDisInsert, object: nil)
        dismiss(animated: true, completion: nil)
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