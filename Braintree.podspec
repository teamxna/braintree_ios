Pod::Spec.new do |s|
  s.name             = "Braintree"
  s.version          = "3.8.1"
  s.summary          = "Braintree v.zero: A modern foundation for accepting payments"
  s.description      = <<-DESC
                       Braintree is a full-stack payments platform for developers

                       This CocoaPod will help you accept payments in your iOS app.

                       Check out our development portal at https://developers.braintreepayments.com.
  DESC
  s.homepage         = "https://www.braintreepayments.com/v.zero"
  s.documentation_url = "https://developers.braintreepayments.com/ios/start/hello-client"
  s.screenshots      = "https://raw.githubusercontent.com/braintree/braintree_ios/master/screenshot.png"
  s.license          = "MIT"
  s.author           = { "Braintree" => "code@getbraintree.com" }
  s.source           = { :git => "https://github.com/braintree/braintree_ios.git", :tag => s.version.to_s }
  s.social_media_url = "https://twitter.com/braintree"

  s.platform         = :ios, "7.0"
  s.requires_arc     = true

  s.source_files     = "Braintree/*.{m,h}"

  s.compiler_flags = "-Wall -Werror -Wextra"

  s.default_subspecs = %w[Drop-In API PayPal Venmo Coinbase UI Payments]

  s.subspec "Apple-Pay" do |s|
    s.dependency "Braintree/Payments"
    s.xcconfig = { "GCC_PREPROCESSOR_DEFINITIONS" => "BT_ENABLE_APPLE_PAY=1" }
    s.frameworks = "PassKit"
  end

  s.subspec "Drop-In" do |s|
    s.source_files  = "Braintree/Drop-In/**/*.{h,m}"
    s.dependency "Braintree/API"
    s.dependency "Braintree/PayPal"
    s.dependency "Braintree/UI"
    s.dependency "Braintree/Venmo"
    s.dependency "Braintree/Coinbase"
    s.dependency "Braintree/Payments"
    s.resource_bundle = { "Braintree-Drop-In-Localization" => "Braintree/Drop-In/Localization/*.lproj" }
  end

  s.subspec "API" do |s|
    s.source_files  = "Braintree/API/**/*.{h,m}"
    s.public_header_files = "Braintree/API/@Public/*.h"
    s.weak_frameworks = "PassKit"
    s.frameworks = "AddressBook"
  end

  s.subspec "PayPal" do |s|
    s.source_files = "Braintree/PayPal/**/*.{h,m}"
    s.public_header_files = "Braintree/PayPal/@Public/**/*.h"
    s.frameworks = "AVFoundation", "CoreLocation", "CoreMedia", "AudioToolbox", "MessageUI", "SystemConfiguration", "MobileCoreServices"
    s.vendored_library = "Braintree/PayPal/mSDK/libPayPalMobile-BT.a"
    s.xcconfig = { "OTHER_LDFLAGS" => "-ObjC -lc++" }
    s.dependency "Braintree/API"
    s.dependency "Braintree/UI"
  end

  s.subspec "Venmo" do |s|
    s.source_files = "Braintree/Venmo/**/*.{h,m}"
    s.compiler_flags = "-Wall -Wextra"
    s.dependency "Braintree/API"
  end

  s.subspec "UI" do |s|
    s.source_files  = "Braintree/UI/**/*.{h,m}"
    s.compiler_flags = "-Wall -Wextra"
    s.frameworks = "UIKit"
    s.resource_bundle = { "Braintree-UI-Localization" => "Braintree/UI/Localization/*.lproj" }
    s.dependency "Braintree/API"
  end

  s.subspec "Data" do |s|
    s.source_files = "Braintree/Data/**/*.{h,m}"
    s.vendored_library = "Braintree/Data/libDeviceCollectorLibrary.a"
    s.frameworks = "UIKit", "SystemConfiguration"
    s.dependency "Braintree/PayPal"
    s.dependency "Braintree/API"
  end

  s.subspec "Payments" do |s|
    s.source_files = "Braintree/Payments/**/*.{h,m}"
    s.public_header_files = "Braintree/Payments/@Public/*.h"
    s.frameworks = "UIKit"
    s.dependency "Braintree/API"
    s.dependency "Braintree/PayPal"
    s.dependency "Braintree/Venmo"
    s.dependency "Braintree/Coinbase"
  end

  s.subspec "3D-Secure" do |s|
    s.source_files = "Braintree/3D-Secure/**/*.{h,m}"
    s.public_header_files = "Braintree/3D-Secure/@Public/*.h"
    s.frameworks = "UIKit"
    s.dependency "Braintree/API"
    s.dependency "Braintree/UI"
    s.dependency "Braintree/Payments"
    s.resource_bundle = { "Braintree-3D-Secure-Localization" => "Braintree/3D-Secure/Localization/*.lproj" }
  end

  s.subspec "Coinbase" do |s|
    s.source_files = "Braintree/Coinbase/**/*.{h,m}"
    s.public_header_files = "Braintree/Coinbase/@Public/*.h"
    s.dependency "coinbase-official/OAuth", "~> 2.1.1"
    s.dependency "Braintree/API"
  end
end

