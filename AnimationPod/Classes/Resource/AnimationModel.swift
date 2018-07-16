//
//  AnimationModel.swift
//  AnimationPod
//
//  Created by ken.zhang on 2018/7/16.
//

import UIKit
import Lottie

class AnimationModel {

    public var fileName: String
    public var container: UIView
    public var animationView: LOTAnimationView

    public init(fileName: String, container: UIView) {
        self.fileName = fileName
        self.container = container
        self.animationView = LOTAnimationView(name: fileName)
    }
}
