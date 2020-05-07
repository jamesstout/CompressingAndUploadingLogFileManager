#
# Be sure to run `pod lib lint CompressingAndUploadingLogFileManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CompressingAndUploadingLogFileManager'
  s.version          = '0.1.4'
  s.summary          = 'Remote logging via NSURLSession transfer to upload compressed CocoaLumberjack logger logs to an HTTP server'

  s.description      = <<-DESC
A mashup of the example CompressingLogFileManager in CocoaLumberjack and 
BackgroundUpload-CocoaLumberjack: https://github.com/pushd/BackgroundUpload-CocoaLumberjack. 
Once the log file is compressed, it's uploaded to an HTTP server, the deleted.
                       DESC

  s.homepage         = 'https://github.com/jamesstout/CompressingAndUploadingLogFileManager'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jamesstout' => 'stoutyhk@gmail.com' }
  s.source           = { :git => 'https://github.com/jamesstout/CompressingAndUploadingLogFileManager.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/stoutyhk'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CompressingAndUploadingLogFileManager/Classes/**/*'
  s.public_header_files = 'CompressingAndUploadingLogFileManager/Classes/**/*.h'
  
  s.dependency 'CocoaLumberjack'
end
