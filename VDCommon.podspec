Pod::Spec.new do |s|
    s.name         = 'VDCommon'
    s.version      = '1.0.0'
    s.summary      = 'a common component'
    s.homepage     = 'https://github.com/VolientDuan/Common'
    s.license      = 'MIT'
    s.authors      = { 'volientDuan' => 'volientduan@163.com' }
    s.platform     = :ios, '8.0'
    s.framework = "UIKit"
    s.source       = { :git => 'https://github.com/VolientDuan/Common.git', :tag => s.version }
    s.requires_arc = true
    s.source_files = 'Common/VDCommon/VDCommon.h'
    s.subspec 'Tool' do |ss|
        ss.ios.deployment_target = '8.0'
        ss.source_files = 'Common/VDCommon/Tool/VDTool.h','Common/VDCommon/Tool/**/**.{h,m}'
    end
    s.subspec 'Category' do |ss|
        ss.ios.deployment_target = '8.0'
        ss.source_files = 'Common/VDCommon/Category/VDCategory.h','Common/VDCommon/Category/**/**.{h,m}'
    end
end
