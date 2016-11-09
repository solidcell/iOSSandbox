source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '9.3'

use_frameworks!

def shared_pods
  pod 'RealmSwift', '~> 2.0.2'
end

target 'iOSSandbox' do
  shared_pods
end

target 'iOSSandboxTests' do
  shared_pods
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end

