//
//  ViewController.swift
//  AnimationPod
//
//  Created by 272388559@qq.com on 07/16/2018.
//  Copyright (c) 2018 272388559@qq.com. All rights reserved.
//

import UIKit
import AnimationPod
import SnapKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
        let btn = UIButton(type: .system)
        self.view.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(100)
            make.height.equalTo(30)
        }
        btn.setTitle("点我", for: .normal)
        btn.addTarget(self, action: "go", for: .touchUpInside)
    }

    @objc func go() {
        self.navigationController?.pushViewController(MainViewController(), animated: true)
    }

}

