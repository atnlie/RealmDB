# atnlie@gmail.com
# platform :ios, '9.0'


def repo_pods
  pod 'RealmSwift'
end

target 'RealmDB' do
  use_frameworks!
  repo_pods
end

post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['SWIFT_VERSION'] = '3.0'
  end
 end
end