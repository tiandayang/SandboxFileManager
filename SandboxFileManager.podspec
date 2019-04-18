Pod::Spec.new do |s|
s.name = 'SandboxFileManager'
s.version = '1.2.0'
s.license = { :type => "MIT", :file => "LICENSE" }
s.summary = 'you can use this lib to look all of the files in sandbox'
s.homepage = 'https://github.com/tiandayang/SandboxFileManager'
s.authors = { 'tiandayang' => '254711559@qq.com' }
s.source = { :git => 'https://github.com/tiandayang/SandboxFileManager.git', :tag => s.version }
s.requires_arc = true
s.ios.deployment_target = '8.0'
s.source_files = 'SandboxFileManager/Source/**/*.swift'
s.resource     = 'SandboxFileManager/Source/image/WXXImage.bundle'
s.description  = <<-DESC
                  you can use this lib to look all of the files in sandbox,
                  of course
                   DESC
s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
 s.framework    = "UIKit","Foundation"
end