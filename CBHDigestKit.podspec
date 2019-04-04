Pod::Spec.new do |spec|

  spec.name                   = "CBHDigestKit"
  spec.version                = "1.2"
  spec.module_name            = "CBHDigestKit"

  spec.summary                = "An easy-to-use category for `NSData` and `NSString` to calculate digests."
  spec.homepage               = "https://github.com/chris-huxtable/CBHDigestKit"

  spec.license                = { :type => "ISC", :file => "LICENSE" }

  spec.author                 = { "Chris Huxtable" => "chris@huxtable.ca" }
  spec.social_media_url       = "https://twitter.com/@Chris_Huxtable"

  #spec.ios.deployment_target = '9.0'
  spec.osx.deployment_target  = '10.8'

  spec.source                 = { :git => "https://github.com/chris-huxtable/CBHDigestKit.git", :tag => "v#{spec.version}" }

  spec.requires_arc           = true

  spec.public_header_files    = 'CBHDigestKit/*.h'
  spec.source_files           = "CBHDigestKit/*.{h,m}"

end
