//
//  AnimationView.swift
//  AnimationPod
//
//  Created by ken.zhang on 2018/7/16.
//

import UIKit
import Lottie
import SnapKit

public class AnimationView: NSObject {

    public static func playAnimation(fileName: String,
                                     container: UIView,
                                     make: ((ConstraintMaker) -> Void)? = { (maker) in maker.edges.equalToSuperview() },
                                     loopAnimation: Bool = false,
                                     fromProgress: CGFloat? = 0,
                                     toProgress: CGFloat? = 1,
                                     _ finishHandler: (() -> Void)? = nil) {
        let animationView = LOTAnimationView(name: fileName)
        container.addSubview(animationView)
        if let make = make {
            animationView.snp.makeConstraints(make)
        }
        animationView.loopAnimation = loopAnimation
        animationView.play(fromProgress: fromProgress ?? 0, toProgress: toProgress ?? 1) { (isEnd) in
            if isEnd {
                animationView.removeFromSuperview()
                finishHandler?()
            }
        }
    }

    public static func playAnimation(animationModel: AnimationModel, _ finishHandler: (() -> Void)? = nil) {
        guard let animationView = animationModel.animationView else {
            return
        }
        animationModel.container.addSubview(animationView)
        if let make = animationModel.make {
            animationView.snp.makeConstraints(make)
        }
        animationView.loopAnimation = animationModel.loopAnimation
        animationView.play(fromProgress: animationModel.fromProgress, toProgress: animationModel.toProgress) { (isEnd) in
            if isEnd {
                animationView.removeFromSuperview()
                finishHandler?()
            }
        }
    }

    public static func playAnimations(animationModels: [AnimationModel], _ finishHandler: ((AnimationModel) -> Void)? = nil) {
        animationModels.forEach { (model) in
            playAnimation(animationModel: model, {
                finishHandler?(model)
            })
        }
    }

    public static func dismissAnimation(animationView: LOTAnimationView, _ finishHandler: (() -> Void)? = nil) {
        animationView.removeFromSuperview()
        finishHandler?()
    }

    public static func dismissAnimation(animationModel: AnimationModel, _ finishHandler: (() -> Void)? = nil) {
        guard let animationView = animationModel.animationView else {
            return
        }
        dismissAnimation(animationView: animationView, finishHandler)
    }
}
