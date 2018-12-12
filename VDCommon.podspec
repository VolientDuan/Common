Pod::Spec.new do |s|
    s.name         = 'VDCommon'
    s.version      = '1.0.0'
    s.summary      = 'VolientDuan's common component'
    s.homepage     = 'https://github.com/VolientDuan/Common'
    s.license      = 'MIT'
    s.authors      = {'volientDuan' => 'volientduan@163.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/VolientDuan/Common.git', :tag => s.version}
    s.requires_arc = true
    s.source_files = 'Common/VDCommon/VDCommon.h'
    s.subspec 'Tool' do |ss|
        ss.source_files = 'Common/VDCommon/Tool/**.{h,m}'
    end
    s.subspec 'Category' do |ss|
        ss.source_files = 'Common/VDCommon/Category/**.{h,m}'
    end
end
