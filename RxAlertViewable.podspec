# Be sure to run `pod lib lint RxOrientation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RxAlertViewable'
  s.version          = '0.8.3'
  s.summary          = 'A simple alert library with RxSwift supported.'

  s.description      = <<-DESC
RxAlertViewable is created for developing the MVVM app with RxSwift. It supports to show a simple alert from the view model class using the signal Observable<RxAlert>.
                       DESC

  s.homepage         = 'https://github.com/lm2343635/RxAlertViewable'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lm2343635' => 'lm2343635@126.com' }
  s.source           = { :git => 'https://github.com/lm2343635/RxAlertViewable.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'
  s.source_files = 'RxAlertViewable/Classes/**/*'
  s.dependency 'RxSwift', '~> 5'
  s.dependency 'RxCocoa', '~> 5'

end
