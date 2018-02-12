Pod::Spec.new do |s|

  s.name         = "ZZUtils"
  s.version      = "0.0.1"
  s.summary      = "personal utils"
  s.description  = <<-DESC
    我的工具库, Objective-C的iOS项目使用
                   DESC
  s.homepage     = "https://github.com/vinsent/ZZUtils"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "vinsent" => "vintsingle@gmail.com" }
  s.platform     = :ios, "8.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source       = { :git => "https://github.com/vinsent/ZZUtils.git", :tag => "#{s.version}" }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source_files  = "ZZUtils", "ZZUtils/**/*.{h,m}"
  #s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "ZZUtils/ZZUtils.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.framework  = "UIKit"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # s.requires_arc = true
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
