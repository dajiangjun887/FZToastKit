#
# Be sure to run `pod lib lint FZToastKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FZToastKit'
  s.version          = '0.1.0'
  s.summary          = 'FZToastKit.'
  s.swift_version    = ['4.0', '4.2', '5.0']

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: toast弹窗库，支持适配iPhone和iPad；内部存储有部分状态图片，也可以自定义图片传入，或者改变文字和图片的位置.
                       DESC

  s.homepage         = 'https://github.com/dajiangjun887/FZToastKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dajiangjun887' => '1178561885@qq.com' }
  s.source           = { :git => 'https://github.com/dajiangjun887/FZToastKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'FZToastKit/Classes/**/*'
  
   s.resource_bundles = {
     'FZToastKit' => ['FZToastKit/Assets/**/*']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'FZCommonKit', '~> 0.1.1'
end
