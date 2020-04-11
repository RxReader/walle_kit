#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint walle_kit.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'walle_kit'
  s.version          = '0.0.1'
  s.summary          = 'A powerful Flutter plugin allowing developers to read/write channelId to apk with Walle Tools/SDKs.'
  s.description      = <<-DESC
A powerful Flutter plugin allowing developers to read/write channelId to apk with Walle Tools/SDKs.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end
