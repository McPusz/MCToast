Pod::Spec.new do |s|

#1
  s.platform     = :ios
  s.ios.deployment_target = "10.0"
  s.name         = "MCToast"
  s.summary      = "MCToast lets a user create simple popups with text inspired by Android Toasts."

#2
  s.version      = "0.0.1"

#3
  s.license      = { :type => "MIT", :file => "LICENSE" }

#4
  s.author             = "Magdalena Pałka"

#5
  s.source       = { :git => "https://github.com/McPusz/MCToast.git", :tag => "#{s.version}" }
  s.homepage = "https://github.com/McPusz/MCToast"

#6
  s.source_files  = "Classes", "Classes/**/*.{h,m}", "MCToast/**/*.{swift}"
  s.exclude_files = "Classes/Exclude"

end
