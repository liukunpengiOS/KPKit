
Pod::Spec.new do |s|

    s.name         = "KPKit"
    s.version      = "0.0.4"
    s.summary      = "A simple framework for iOS Program"
    s.homepage     = "https://github.com/liukunpengiOS/KPKit.git"
    s.license      = "MIT"
    s.author       = { "kunpeng" => "1169405067@qq.com" }
    s.platform     = :ios, "8.0"
    s.source       = { :git => "https://github.com/liukunpengiOS/KPKit.git", :tag => "0.0.4" }
    s.source_files = "KPKit/**/*.{h,m}"
    s.requires_arc = true
end