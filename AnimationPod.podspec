
Pod::Spec.new do |s|
  s.name             = 'AnimationPod'
  s.version          = '0.1.0'
  s.swift_version = '3.2'
  s.summary          = 'Animation view which is based on Lottie-iOS'

  s.description      = <<-DESC
A public animation view based on Lottie-iOS
                       DESC

  s.homepage         = 'https://github.com/AlphaJian/AnimationPod'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '272388559@qq.com' => 'ken.zhang@alo7.com' }
  s.source           = { :git => 'https://github.com/AlphaJian/AnimationPod.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'AnimationPod/Resource/*.swift'
  
  s.dependency 'lottie-ios', '2.5.0'
  s.dependency 'SnapKit', '3.2.0'

  # s.resource_bundles = {
  #   'AnimationPod' => ['AnimationPod/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
