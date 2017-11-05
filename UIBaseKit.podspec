#
# Be sure to run `pod lib lint UIBaseKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UIBaseKit'
  s.version          = '0.1.0'
  s.summary          = 'This helps make the view`s configuration code, hierarchy code, and constraint code neat.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
So far, when coding for a view, we wrote a combination of configuration code, constraint code, and hierarchical code, resulting in a poor understanding of the source. So, I created a library that helps you separate this configuration code, constraint code, and hierarchical code to make it cleaner.
                       DESC

  s.homepage         = 'https://github.com/audrl1010/UIBaseKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'audrl1010' => 'audrl1010@naver.com' }
  s.source           = { :git => 'https://github.com/audrl1010/UIBaseKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'UIBaseKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'UIBaseKit' => ['UIBaseKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
