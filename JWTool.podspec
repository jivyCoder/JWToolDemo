Pod::Spec.new do |s|
s.name         = "JWTool"
s.version      = "0.0.1"
s.ios.deployment_target = '8.0'
s.summary      = "工具类"
s.description  = "工作中用到的一些工具类,分类等"
s.homepage     = "https://github.com/jivyCoder/JWToolDemo"
s.license      = "MIT"
s.author       = { "jiawei" => "513590934@qq.com" }
s.source       = { :git => "https://github.com/jivyCoder/JWToolDemo.git", :tag => "#{s.version}" }
s.source_files = "JWTool"
s.requires_arc = true 
end
