//
//  ViewController.swift
//  YOURSSU_incubating#3
//
//  Created by 지희의 MAC on 2022/05/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Vector


        var view = UILabel()

        view.frame = CGRect(x: 0, y: 0, width: 116.91, height: 32.95)

        view.backgroundColor = .white


        view.layer.backgroundColor = UIColor(red: 0.149, green: 0.149, blue: 0.149, alpha: 1).cgColor


        var parent = self.view!

        parent.addSubview(view)

        view.translatesAutoresizingMaskIntoConstraints = false
    }


}

