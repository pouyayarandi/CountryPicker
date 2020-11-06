# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

target 'CountryPicker' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for CountryPicker
  pod 'Moya'
  pod 'SwiftLint'
  pod 'PromiseKit'
  pod 'RxSwift'
  pod 'RxCocoa'

  target 'CountryPickerTests' do
    inherit! :search_paths
  end

  target 'CountryPickerUITests' do
    # Pods for testing
  end
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
      end
    end
  end

end
