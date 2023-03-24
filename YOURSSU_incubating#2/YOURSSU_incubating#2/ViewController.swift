//
//  ViewController.swift
//  YOURSSU_incubating#2
//
//  Created by 지희의 MAC on 2022/05/09.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func click_newButton(_ sender: Any) {
        //storyboard find controller
        
        //옵셔널 바인딩
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailController"){
            //push controller = navi
            self.navigationController?.pushViewController(controller, animated: true)
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

