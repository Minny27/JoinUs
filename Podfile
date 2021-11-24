# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'JoinUs' do

  # Rxswift
  pod 'RxSwift'
  pod 'RxCocoa'
  
  # Alamofire
  pod 'Alamofire', '~> 5.4'
  
  # SwiftSoup
  pod 'SwiftSoup'
  
  post_install do |installer|
      installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '10.0'
        end
      end
  end
end
