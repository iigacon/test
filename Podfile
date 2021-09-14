# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
platform :ios, '14.0'
source "https://gitlab.linphone.org/BC/public/podspec.git"

def basic_pods
  if ENV['PODFILE_PATH'].nil?
    pod 'linphone-sdk', '~> 4.4.0-beta'
    else
    pod 'linphone-sdk', :path => ENV['PODFILE_PATH']  # local sdk
  end
  end


target 'TimaAppraiser' do
  use_frameworks!
  basic_pods

end
