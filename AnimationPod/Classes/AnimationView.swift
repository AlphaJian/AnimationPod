//
//  AnimationView.swift
//  AnimationPod
//
//  Created by ken.zhang on 2018/7/16.
//

import UIKit
import Lottie

class AnimationView: NSObject {

    public static func playAnimation(animationModel: AnimationModel, _ finishHandler: (() -> Void)? = nil) {
        animationModel.container.addSubview(animationModel.animationView)
        animationModel.animationView.play { (isEnd) in
            if isEnd {
                animationModel.animationView.removeFromSuperview()
                finishHandler?()
            }
        }
    }

}
