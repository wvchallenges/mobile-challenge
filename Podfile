#
# Last scrubbed:  06-26-2020
#

# +----------+
# | Settings |
# +----------+

workspace 'Listings'
platform :ios, '13.0'
use_frameworks!
ENV["COCOAPODS_DISABLE_STATS"] = 'true'
source 'https://github.com/CocoaPods/Specs.git'

# +---------+
# | Targets |
# +---------+

target :'Listings' do
    pod 'Swinject'
    pod 'RxSwift'
    pod 'Moya/RxSwift'

    target :'ListingsTests' do
        inherit! :search_paths
        pod 'Quick'
        pod 'Nimble'
    end
end

