#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint live_session_whiteboard.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'live_session_whiteboard'
  s.version          = '0.0.1'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  s.dependency 'Masonry'
  s.dependency 'NETURLSchemeHandler'
  s.dependency 'SSZipArchive'


  # Resource whiteboard-bridge打包
  s.subspec 'Resource' do |src|
    src.resource_bundles = {
      'Whiteboard' => ['Agora/Whiteboard/Resource/*']
    }
  end

  # Model-YYModel
  s.subspec 'Model' do |model|
    model.dependency 'YYModel'
    model.source_files = 'Agora/Whiteboard/Classes/Model/**'
    model.public_header_files = 'Agora/Whiteboard/Classes/Model/**.h'
    model.private_header_files = 'Agora/Whiteboard/Classes/Object/*+Private.h'
    model.frameworks = 'UIKit'
  end

  # Model-YYKit
  s.subspec 'Model-YYKit' do |model|
    model.dependency 'YYKit'
    model.source_files = 'Agora/Whiteboard/Classes/Model/**'
    model.public_header_files = 'Agora/Whiteboard/Classes/Model/**.h'
    model.private_header_files = 'Agora/Whiteboard/Classes/Object/*+Private.h'
    model.frameworks = 'UIKit'
  end

# JSON对象-YYModel
# s.subspec 'Object' do |object|
#   object.source_files = 'Agora/Whiteboard/Classes/Object/**'
#   object.public_header_files = 'Agora/Whiteboard/Classes/Object/**.h'
#   object.private_header_files = 'Agora/Whiteboard/Classes/Object/*+Private.h'
#   object.dependency 'Agora/Whiteboard/Model'
#   object.frameworks = 'UIKit'
# end

# # JSON对象-YYKit
# s.subspec 'Object-YYKit' do |object|
#   object.source_files = 'Agora/Whiteboard/Classes/Object/**'
#   object.public_header_files = 'Agora/Whiteboard/Classes/Object/**.h'
#   object.private_header_files = 'Agora/Whiteboard/Classes/Object/*+Private.h'
#   object.dependency 'Agora/Whiteboard/Model-YYKit'
#   object.frameworks = 'UIKit'
# end

# # PPT转码 http 请求封装 - YYModel
# s.subspec 'Converter' do |converter|
#   converter.source_files = 'Agora/Whiteboard/Classes/Converter/**/*'
#   converter.public_header_files = 'Agora/Whiteboard/Classes/Converter/**/*.h'
#   converter.dependency 'Agora/Whiteboard/Object'
# end

# # PPT转码 http 请求封装 - YYKit
# s.subspec 'Converter-YYKit' do |converter|
#   converter.source_files = 'Agora/Whiteboard/Classes/Converter/**/*'
#   converter.public_header_files = 'Agora/Whiteboard/Classes/Converter/**/*.h'
#   converter.dependency 'Agora/Whiteboard/Object-YYKit'
# end

# # 基础类，包括sdk，Displayer（Room与Player父类）- YYModel
# s.subspec 'Base' do |base|
#   base.source_files = 'Agora/Whiteboard/Classes/SDK/**', 'Agora/Whiteboard/Classes/Displayer/**'
#   base.public_header_files = 'Agora/Whiteboard/Classes/Displayer/**.h', 'Agora/Whiteboard/Classes/SDK/**.h'
#   base.private_header_files = 'Agora/Whiteboard/Classes/Displayer/*+Private.h', 'Agora/Whiteboard/Classes/SDK/*+Private.h'
#   base.frameworks = 'WebKit'
#   base.dependency 'NTLBridge', '~> 3.1.2'
#   base.dependency 'Agora/Whiteboard/Object'
# end

# # 基础类，包括sdk，Displayer（Room与Player父类）- YYKit
# s.subspec 'Base-YYKit' do |base|
#   base.source_files = 'Agora/Whiteboard/Classes/SDK/**', 'Agora/Whiteboard/Classes/Displayer/**'
#   base.public_header_files = 'Agora/Whiteboard/Classes/Displayer/**.h', 'Agora/Whiteboard/Classes/SDK/**.h'
#   base.private_header_files = 'Agora/Whiteboard/Classes/Displayer/*+Private.h', 'Agora/Whiteboard/Classes/SDK/*+Private.h'
#   base.frameworks = 'WebKit'
#   base.dependency 'NTLBridge', '~> 3.1.2'
#   base.dependency 'Agora/Whiteboard/Object-YYKit'
# end

# # 实时房间 - YYModel
# s.subspec 'Room' do |room|
#   room.source_files = 'Agora/Whiteboard/Classes/Room/**'
#   room.public_header_files = 'Agora/Whiteboard/Classes/Room/**.h'
#   room.private_header_files = 'Agora/Whiteboard/Classes/Room/*+Private.h', 'Agora/Whiteboard/Classes/Room/Private/**.h'
#   room.dependency 'Agora/Whiteboard/Base'
# end

# # 实时房间 - YYKit
# s.subspec 'Room-YYKit' do |room|
#   room.source_files = 'Agora/Whiteboard/Classes/Room/**'
#   room.public_header_files = 'Agora/Whiteboard/Classes/Room/**.h'
#   room.private_header_files = 'Agora/Whiteboard/Classes/Room/*+Private.h', 'Agora/Whiteboard/Classes/Room/Private/**.h'
#   room.dependency 'Agora/Whiteboard/Base-YYKit'
# end

# # 回放房间 - YYModel
# s.subspec 'Replayer' do |replayer|
#   replayer.source_files = 'Agora/Whiteboard/Classes/Replayer/**'
#   replayer.public_header_files = 'Agora/Whiteboard/Classes/Replayer/**.h'
#   replayer.private_header_files = 'Agora/Whiteboard/Classes/Replayer/*+Private.h'
#   replayer.dependency 'Agora/Whiteboard/Base'
# end

# # 回放房间 - YYKit
# s.subspec 'Replayer-YYKit' do |replayer|
#   replayer.source_files = 'Agora/Whiteboard/Classes/Replayer/**'
#   replayer.public_header_files = 'Agora/Whiteboard/Classes/Replayer/**.h'
#   replayer.private_header_files = 'Agora/Whiteboard/Classes/Replayer/*+Private.h'
#   replayer.dependency 'Agora/Whiteboard/Base-YYKit'
# end

# # 音视频 native 与回放房间结合 - YYModel
# s.subspec 'NativeReplayer' do |naitve|
#   naitve.source_files = 'Agora/Whiteboard/Classes/NativeReplayer/**'
#   naitve.public_header_files = 'Agora/Whiteboard/Classes/NativeReplayer/**.h'
#   naitve.private_header_files = 'Agora/Whiteboard/Classes/NativeReplayer/*+Private.h'
#   naitve.dependency 'Agora/Whiteboard/Replayer'
#   naitve.frameworks = 'AVFoundation'
# end

# # 对SyncPlayer的支持
# s.subspec 'SyncPlayer' do |sync|
#   sync.source_files = 'Agora/Whiteboard/Classes/SyncPlayer/**'
#   sync.public_header_files = 'Agora/Whiteboard/Classes/SyncPlayer/**.h'
#   sync.private_header_files = 'Agora/Whiteboard/Classes/SyncPlayer/*+Private.h'
#   sync.dependency 'Agora/Whiteboard/Replayer'
#   sync.dependency 'SyncPlayer'
# end

# # 对SyncPlayer的支持 - YYKit
# s.subspec 'SyncPlayer-YYKit' do |sync|
#   sync.source_files = 'Agora/Whiteboard/Classes/SyncPlayer/**'
#   sync.public_header_files = 'Agora/Whiteboard/Classes/SyncPlayer/**.h'
#   sync.private_header_files = 'Agora/Whiteboard/Classes/SyncPlayer/*+Private.h'
#   sync.dependency 'Agora/Whiteboard/Replayer-YYKit'
#   sync.dependency 'SyncPlayer'
# end

# # 音视频 native 与回放房间结合 - YYKit
# s.subspec 'NativeReplayer-YYKit' do |naitve|
#   naitve.source_files = 'Agora/Whiteboard/Classes/NativeReplayer/**'
#   naitve.public_header_files = 'Agora/Whiteboard/Classes/NativeReplayer/**.h'
#   naitve.private_header_files = 'Agora/Whiteboard/Classes/NativeReplayer/*+Private.h'
#   naitve.dependency 'Agora/Whiteboard/Replayer-YYKit'
#   naitve.frameworks = 'AVFoundation'
# end

# # socket 代理 - YYModel
# s.subspec 'fpa' do |socket|
#   socket.source_files = 'Agora/Whiteboard/Classes/fpa/**'
#   socket.public_header_files = 'Agora/Whiteboard/Classes/fpa/**.h'
#   socket.private_header_files = 'Agora/Whiteboard/Classes/fpa/*+Private.h'
#   socket.dependency 'Agora/Whiteboard/Room'
#   socket.dependency 'AgoraFPA_iOS', '~> 1.0.0'
#   # 这个限制是因为fpa的framework没有i386的版本，导致需要ios11以上才能用
#   socket.ios.deployment_target = '11.0'
#   # 这个config是因为fpa的framework没有simulator-arm64的版本，需要手动剔除
#   socket.pod_target_xcconfig = { "EXCLUDED_ARCHS[sdk=iphonesimulator*]" => "arm64" }
#   socket.user_target_xcconfig = { "EXCLUDED_ARCHS[sdk=iphonesimulator*]" => "arm64" }
# end

# # socket 代理 - YYKit
# s.subspec 'fpa-YYKit' do |socket|
#   socket.source_files = 'Agora/Whiteboard/Classes/fpa/**'
#   socket.public_header_files = 'Agora/Whiteboard/Classes/fpa/**.h'
#   socket.private_header_files = 'Agora/Whiteboard/Classes/fpa/*+Private.h'
#   socket.dependency 'Agora/Whiteboard/Room-YYKit'
#   socket.dependency 'AgoraFPA_iOS', '~> 1.0.0'
#   # 这个限制是因为fpa的framework没有i386的版本，导致需要ios11以上才能用
#   socket.ios.deployment_target = '11.0'
#   # 这个config是因为fpa的framework没有simulator-arm64的版本，需要手动剔除
#   socket.pod_target_xcconfig = { "EXCLUDED_ARCHS[sdk=iphonesimulator*]" => "arm64" }
#   socket.user_target_xcconfig = { "EXCLUDED_ARCHS[sdk=iphonesimulator*]" => "arm64" }
# end

# s.subspec 'Whiteboard-YYModel' do |sp|
#     sp.public_header_files = 'Agora/Whiteboard/Classes/Whiteboard.h'
#     sp.source_files = 'Agora/Whiteboard/Classes/Whiteboard.h'
#     sp.dependency 'Agora/Whiteboard/Resource'
#     sp.dependency 'Agora/Whiteboard/Converter'
#     sp.dependency 'Agora/Whiteboard/Room'
#     sp.dependency 'Agora/Whiteboard/NativeReplayer'
# end

# s.subspec 'Whiteboard-YYKit' do |sp|
#     sp.public_header_files = 'Agora/Whiteboard/Classes/Whiteboard.h'
#     sp.source_files = 'Agora/Whiteboard/Classes/Whiteboard.h'
#     sp.dependency 'Agora/Whiteboard/Resource'
#     sp.dependency 'Agora/Whiteboard/Converter-YYKit'
#     sp.dependency 'Agora/Whiteboard/Room-YYKit'
#     sp.dependency 'Agora/Whiteboard/NativeReplayer-YYKit'
# end

  # s.default_subspec = 'Whiteboard-YYModel'
end
