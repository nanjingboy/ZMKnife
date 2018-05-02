Pod::Spec.new do |s|
  s.name             = 'ZMKnife'
  s.version          = '0.1.0'
  s.summary          = 'Some widgets I often used in projects'
  s.homepage         = 'https://github.com/nanjingboy/ZMKnife'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Tom.Huang' => 'hzlhu.dargon@gmail.com' }
  s.source           = { :git => 'https://github.com/nanjingboy/ZMKnife.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.requires_arc = true
  s.source_files = "Source/*.swift"
  s.resource_bundles = {
    'ZMKnife' => ['Assets.xcassets']
  }
  s.dependency 'SnapKit'
end