# Geography

[![Version](https://img.shields.io/cocoapods/v/KSGeography.svg?style=flat)](http://cocoapods.org/pods/KSGeography)
[![License](https://img.shields.io/cocoapods/l/KSGeography.svg?style=flat)](http://cocoapods.org/pods/KSGeography)
[![Platform](https://img.shields.io/cocoapods/p/KSGeography.svg?style=flat)](http://cocoapods.org/pods/KSGeography)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

KSGeography is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod "KSGeography"
```

## Usage

### Countries

```objc
KSCountry *country = [KSCountry named:@"Canada"]; // <KSCountry name="Canada" code="CAN">
country.name; // "Canada"
country.code; // "CAN"
```

### Regions

```objc
KSRegion *region = [country.regions named:@"Ontario"]; // <KSCountry name="Ontario" code="ON" type="province">
region.name; // "Ontario"
region.code; // "ON"
```

## Author

Kevin Sylvestre, kevin@ksylvest.com

## License

KSGeography is available under the MIT license. See the LICENSE file for more info.
