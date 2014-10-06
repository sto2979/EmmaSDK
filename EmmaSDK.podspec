Pod::Spec.new do |spec|
  spec.name         = 'EmmaSDK'
  spec.version      = '1.0'
  spec.platform     = :ios, '6.0'
  spec.license      = 'BSD'
  spec.homepage     = 'https://github.com/sto2979/EmmaSDK'
  spec.author       = { 'Ryan Macy' => 'ryan@hackery.io' }
  spec.summary      = 'An Objective-C client library for the Emma HTTP API.'
  spec.source       = { :git => 'https://github.com/sto2979/EmmaSDK.git', :tag => 'v1.0' }
  spec.source_files = 'EmmaSDK/*.{h,m,c}'
  spec.resources    = 'EmmaSDK/*.png'
  spec.requires_arc = true
  spec.dependency 'ReactiveCocoa'
  spec.dependency 'SBJson'
  spec.dependency 'SMWebRequest'
end