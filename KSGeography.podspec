Pod::Spec.new do |s|
  s.name             = "KSGeography"
  s.version          = "1.0.1"
  s.summary          = "Some basic helpers for handling countries and regions."
  s.description      = <<-DESC
                       Adds in some helper classes for dealing with countries and regions.

                       * Supports both Canada and the US by default.
                       * Can be easily extended with larger lists.
                       DESC
  s.homepage         = "https://github.com/ksylvest/geography"
  s.license          = 'MIT'
  s.author           = { "Kevin Sylvestre" => "kevin@ksylvest.com" }
  s.source           = { :git => "https://github.com/ksylvest/geography.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = { 'KSGeography' => ['Pod/Assets/KSGeography.plist'] }

  s.dependency 'KSReason'
end
