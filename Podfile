# Uncomment the next line to define a global platform for your project
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.0'
use_frameworks!

target 'JoinUs' do

  # Rxswift
  pod 'RxSwift'
  pod 'RxCocoa'
  
  # Alamofire
  pod 'Alamofire', '~> 5.4'
  
  # SwiftSoup
  pod 'SwiftSoup'
  
  # Kingfisher
  pod 'Kingfisher', '~> 7.0'
  
  post_install do |installer|
      installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
        end
      end
  end
end
