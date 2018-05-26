@version = '0.1.0'
@swift_version = '4.1'
@deployment_target = '10.0'
#
# Be sure to run `pod lib lint MYPMarkdownEditor.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MYPMarkdownEditor'
  s.version          = @version
  s.summary          = 'Markdown editor with synax highlight and more more more.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/wakaryry/MYPMarkdownEditor'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wakary' => 'redoume@163.com' }
  s.source           = { :git => 'https://github.com/wakaryry/MYPMarkdownEditor.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = @deployment_target
  s.swift_version = @swift_version

  s.source_files = 'MYPMarkdownEditor/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MYPMarkdownEditor' => ['MYPMarkdownEditor/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
