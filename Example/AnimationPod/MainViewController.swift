//
//  MainViewController.swift
//  AnimationPod_Example
//
//  Created by ken.zhang on 2018/7/17.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import AnimationPod
import SnapKit
import Lottie

class MainViewController: UIViewController {

    @IBOutlet weak var outsider: UIView!
    @IBOutlet weak var insider: UIView!

    var model: AnimationModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func star(_ sender: Any) {
//        AnimationView.playAnimation(fileName: "microphone01", container: self.view)
        AnimationView.playAnimation(fileName: "microphone01", container: self.view, make: nil, loopAnimation: false, fromProgress: nil, toProgress: nil, nil)
    }

    @IBAction func outside(_ sender: Any) {
        let model = AnimationModel(fileName: "microphone01", container: self.view)
        let point = outsider.convert(insider.center, to: self.view)
        model.make = {(make) in
            make.center.equalTo(point)
            make.width.height.equalTo(100)
        }
        AnimationView.playAnimation(animationModel: model)

    }
    @IBAction func palyAll(_ sender: Any) {
        AnimationView.playAnimations(animationModels: [AnimationModel(fileName: "star_me", container: self.view),
                                                       AnimationModel(fileName: "microphone01", container: self.view)]) { (model) in
                                                        print(model.fileName)
        }
    }
    @IBAction func playHalf(_ sender: Any) {
        let model = AnimationModel(fileName: "star_me", container: self.view)
        model.toProgress = 0.5
        AnimationView.playAnimation(animationModel: model)
    }
    @IBAction func playing(_ sender: Any) {
        model = AnimationModel(fileName: "microphone01", container: outsider) { (make) in
            make.top.leading.equalToSuperview()
            make.width.height.equalTo(50)
        }
        model?.loopAnimation = true
        AnimationView.playAnimation(animationModel: model!)
    }

    @IBAction func stop(_ sender: Any) {
        AnimationView.dismissAnimation(animationModel: model!)
    }
    
    deinit {
        print("Over")
    }
}
