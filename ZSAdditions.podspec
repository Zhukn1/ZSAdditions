Pod::Spec.new do |s|

  s.name         = 'ZSAdditions'
  s.version      = '0.0.1'
  s.summary      = 'Personal categories to make iOS life easier.'
  s.homepage     = 'https://github.com/Zhukn1/ZSAdditions'
  s.license      = { :type => 'MIT', :file => 'FILE_LICENSE' }
  s.platform     = :ios, '8.0'
  s.source       = { :git => 'https://github.com/Zhukn1/ZSAdditions.git' }
  s.source_files = 'Pod/Classes/ZSAdditions.{h,m}'
  s.requires_arc = true
  s.author       = { 'Stas Zhukovskiy' => 'stzhuk@gmail.com' }
  s.social_media_url = 'http://twitter.com/Zhukn1'

end
