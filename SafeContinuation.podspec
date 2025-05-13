#
# Be sure to run `pod lib lint SafeContinuation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SafeContinuation'
  s.version          = '0.1.1'
  s.summary          = 'SafeContinuation provides async timeout-safe continuation support in Swift.'

  s.description      = <<-DESC
SafeContinuation is a lightweight Swift library that wraps withCheckedContinuation to ensure
safe resuming and built-in timeout handling. It is designed for concurrency-safe tasks,
especially for bridging async callbacks (e.g. Bluetooth, networking) with Swift's async/await model.
  DESC

  s.homepage         = 'https://github.com/JunkyTang/SafeContinuation'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Lucky' => '921969987@qq.com' }
  s.source           = { :git => 'https://github.com/JunkyTang/SafeContinuation.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.swift_versions = ['5.0', '5.1', '5.2', '5.3', '5.4', '5.5', '5.6', '5.7', '5.8', '5.9'] # 支持所有 Swift 5+
  s.source_files = 'SafeContinuation/Classes/**/*'
end
