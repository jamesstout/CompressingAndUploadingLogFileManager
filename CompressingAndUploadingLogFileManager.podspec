#
# Be sure to run `pod lib lint CompressingAndUploadingLogFileManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CompressingAndUploadingLogFileManager'
  s.version          = '0.1.1'
  s.summary          = 'Remote logging via NSURLSession transfer to upload compressed CocoaLumberjack logger logs to an HTTP server'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A mashup of the example CompressingLogFileManager in CocoaLumberjack and BackgroundUpload-CocoaLumberjack: https://github.com/pushd/BackgroundUpload-CocoaLumberjack. Once the log file is compressed, it's uploaded to an HTTP server, the deleted.
                       DESC

  s.homepage         = 'https://github.com/jamesstout/CompressingAndUploadingLogFileManager'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jamesstout' => 'stoutyhk@gmail.com' }
  s.source           = { :git => 'https://github.com/jamesstout/CompressingAndUploadingLogFileManager.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/stoutyhk'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CompressingAndUploadingLogFileManager/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CompressingAndUploadingLogFileManager' => ['CompressingAndUploadingLogFileManager/Assets/*.png']
  # }

  s.public_header_files = 'CompressingAndUploadingLogFileManager/Classes/**/*.h'
  s.dependency 'CocoaLumberjack'
end
