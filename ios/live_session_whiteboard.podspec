#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint live_session_whiteboard.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'live_session_whiteboard'
  s.version          = '1.0.5'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'https://www.pustack.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**'
  s.dependency 'Flutter'
  s.ios.deployment_target = '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  s.dependency 'Masonry'
  s.dependency 'NETURLSchemeHandler'
  s.dependency 'SSZipArchive'

  s.subspec 'Whiteboard-YYModel' do |sp|
    sp.public_header_files = 'Whiteboard/Classes/Whiteboard.h'
    sp.source_files = 'Whiteboard/Classes/Whiteboard.h'
    sp.dependency 'Whiteboard/Resource'
    sp.dependency 'Whiteboard'
end

  s.default_subspec = 'Whiteboard-YYModel'
end
