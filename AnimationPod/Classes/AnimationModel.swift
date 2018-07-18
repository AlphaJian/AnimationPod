//
//  AnimationModel.swift
//  AnimationPod
//
//  Created by ken.zhang on 2018/7/16.
//

import UIKit
import Lottie
import SnapKit

public class AnimationModel {
    public var fileName: String
    public var container: UIView
    public var animationView: LOTAnimationView?
    public var make: ((ConstraintMaker) -> Void)?
    //  默认设置
    public var fromProgress: CGFloat = 0
    public var toProgress: CGFloat = 1
    public var loopAnimation: Bool = false

    public init(fileName: String,
                container: UIView,
                make: ((ConstraintMaker) -> Void)? = { (maker) in maker.edges.equalToSuperview() }) {
        self.fileName = fileName
        self.container = container
        self.animationView = LOTAnimationView(name: fileName)
        self.make = make
    }
}
