require 'xcodebuild'

task default: :test

task :test do
  sh("xcodebuild test -workspace Example/KSGeography.xcworkspace -scheme KSGeography-Example -sdk iphonesimulator | xcpretty -c")
end