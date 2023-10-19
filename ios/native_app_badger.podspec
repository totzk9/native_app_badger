#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint native_app_badger.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'native_app_badger'
  s.version          = '1.0.0'
  s.summary          = 'A Flutter plugin for managing app icon badges.'
  s.description      = <<-DESC
A Flutter plugin for managing app icon badges.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'TODO' => 'TODO@TODO.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '10.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
