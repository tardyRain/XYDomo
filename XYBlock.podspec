

Pod::Spec.new do |s|

  s.name         = "XYBlock"
  s.version      = "0.0.1"
  s.summary      = "To make a block test"
  s.description  = <<-DESC
                "这是一个长的描述字数要比s.summary长，Test01 is a test lib"
                DESC

  s.homepage     = "https://github.com/tardyRain/XYDomo.git"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

   s.license      = "MIT"
#  s.license      = { :type => 'MIT', :file => 'LICENSE' }
    s.author             = { "wxy" => "wxyter@163.com" }
  # Or just: s.author    = "wxy"
  # s.authors            = { "wxy" => "wxyter@163.com" }
  # s.social_media_url   = "http://twitter.com/wxy"

    s.ios.deployment_target = '8.0'

   s.source       = { :git => "https://github.com/tardyRain/XYDomo.git", :tag => "#{s.version}" }

  s.source_files  = "XYDomo/XYBlock/*.{h,m}"
  # s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"

  s.resource  = "XYDomo/XYDomo/XYBlock/*.xib"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "UIKit"
  # s.frameworks = "UIKit", "Foundation"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
