# Reason

[![Version](https://img.shields.io/cocoapods/v/KSReason.svg?style=flat)](http://cocoapods.org/pods/KSReason)
[![License](https://img.shields.io/cocoapods/l/KSReason.svg?style=flat)](http://cocoapods.org/pods/KSReason)
[![Platform](https://img.shields.io/cocoapods/p/KSReason.svg?style=flat)](http://cocoapods.org/pods/KSReason)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

KSReason is available through [CocoaPods](http://cocoapods.org). To install it add the following line to your Podfile:

```ruby
pod "KSReason"
```

## Usage

### Enumerable

#### Iterating

**Sets:**
```objc
NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
[collection KS_each:^(NSString *object) {
  // ...
}];
```

**Arrays:**
```objc
NSArray *collection = [NSArray arrayWithObjects;@"Canada", @"Greece", @"Russia", NULL];
[collection KS_each:^(NSString *object) {
  // ...
}];
```

**Dictionaries:**
```objc
NSDictionary *collection = @{ @"Canada": @"Victoria", @"Russia": @"Moscow", @"Greece": @"Athens" };
[collection KS_each:^(NSString *key, NSString *value) {
  // ...
}];
```

#### Map

**Sets:**
```objc
NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
NSSet *mapping = [collection KS_map:^NSString *(NSString *object) {
  // ex: NSString *mapping = [object reverse];
  return mapping;
}];
```

**Arrays:**
```objc
NSArray *collection = [NSArray arrayWithObjects;@"Canada", @"Greece", @"Russia", NULL];
NSArray *mapping = [collection KS_map:^NSString *(NSString *object) {
  // ex: NSString *mapping = [object reverse];
  return mapping;
}];
```

**Dictionaries:**
```objc
NSDictionary *collection = @{ @"Canada": @"Victoria", @"Russia": @"Moscow", @"Greece": @"Athens" };
NSDictionary *mapping = [collection KS_map:^NSString *(NSString *key, NSString *value) {
  // ex: NSString *mapping = [value reverse];
  return mapping;
}];
```

#### Reduce

**Sets:**
```objc
NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
NSString *reduction = [collection KS_reduce:^NSString *(NSString *memo, NSString *object){
  return [NSString stringWithFormat:@"%@ %@", memo, object];
} memo:@"reduction:"];
```

**Arrays:**
```objc
NSArray *collection = [NSArray arrayWithObjects;@"Canada", @"Greece", @"Russia", NULL];
NSString *reduction = [collection KS_reduce:^NSString *(NSString *memo, NSString *object){
  return [NSString stringWithFormat:@"%@ %@", memo, object];
} memo:@"reduction:"];
```

**Dictionaries:**
```objc
NSArray *collection = [NSArray arrayWithObjects;@"Canada", @"Greece", @"Russia", NULL];
NSString *reduction = [collection KS_reduce:^NSString *(NSString *memo, NSString *key, NSString *value){
  return [NSString stringWithFormat:@"%@ %@", memo, value];
} memo:@"reduction:"];
```

#### Find

**Sets:**
```objc
NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
NSString *element = [collection KS_find:^BOOL (NSString *object) {
  return [object isEqualToString:@"..."];
}];
```

**Arrays:**
```objc
NSArray *collection = [NSArray arrayWithObjects:@"Canada", @"Greece", @"Russia", NULL];
NSString *element = [collection KS_find:^BOOL (NSString *object) {
  return [object isEqualToString:@"..."];
}];
```

**Dictionaries:**
```objc
NSDictionary *collection = @{ @"Canada" : @"Victoria", @"Greece": @"Athens", @"Russia": @"Moscow" };
NSString *element = [collection KS_find:^BOOL (NSString *key, NSString *value) {
  return [key isEqualToString:@"..."];
}];
```

#### Any

**Sets:**
```objc
NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
BOOL any = [collection KS_any:^BOOL (NSString *object) {
  return [object isEqualToString:@"..."];
}];
```

**Arrays:**
```objc
NSArray *collection = [NSArray arrayWithObjects:@"Canada", @"Greece", @"Russia", NULL];
BOOL any = [collection KS_any:^BOOL (NSString *object) {
  return [object isEqualToString:@"..."];
}];
```

**Dictionaries:**
```objc
NSDictionary *collection = @{ @"Canada" : @"Victoria", @"Greece": @"Athens", @"Russia": @"Moscow" };
BOOL any = [collection KS_any:^BOOL (NSString *key, NSString *value) {
  return [key isEqualToString:@"..."];
}];
```

#### All

**Sets:**
```objc
NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
BOOL all = [collection KS_all:^BOOL (NSString *object) {
  return [object isEqualToString:@"..."];
}];
```

**Arrays:**
```objc
NSArray *collection = [NSArray arrayWithObjects:@"Canada", @"Greece", @"Russia", NULL];
BOOL all = [collection KS_all:^BOOL (NSString *object) {
  return [object isEqualToString:@"..."];
}];
```

**Dictionaries:**
```objc
NSDictionary *collection = @{ @"Canada" : @"Victoria", @"Greece": @"Athens", @"Russia": @"Moscow" };
BOOL all = [collection KS_all:^BOOL (NSString *key, NSString *value) {
  return [key isEqualToString:@"..."];
}];
```

#### Filter

**Sets:**
```objc
NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
NSSet *filter = [collection KS_filter:^BOOL (NSString *object) {
  // ex.: BOOL match = [object isEqualToString:@"..."];
  return match;
}];
```

**Arrays:**
```objc
NSArray *collection = [NSArray arrayWithObjects:@"Canada", @"Greece", @"Russia", NULL];
NSArray *filtered = [collection KS_filter:^BOOL (NSString *object) {
  // ex.: BOOL match = [object isEqualToString:@"..."];
  return match;
}];
```

**Dictionaries:**
```objc
NSDictionary *collection = @{ @"Canada" : @"Victoria", @"Greece": @"Athens", @"Russia": @"Moscow" };
NSDictionary *filtered = [collection KS_filter:^BOOL (NSString *key, NSString *value) {
  // ex.: BOOL match = [key isEqualToString:@"..."] || [value isEqualToString:@"..."];
  return match;
}];
```

#### Reject

**Sets:**
```objc
NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
NSSet *filter = [collection KS_reject:^BOOL (NSString *object) {
  // ex.: BOOL match = [object isEqualToString:@"..."];
  return match;
}];
```

**Arrays:**
```objc
NSArray *collection = [NSArray arrayWithObjects:@"Canada", @"Greece", @"Russia", NULL];
NSArray *filtered = [collection KS_reject:^BOOL (NSString *object) {
  // ex.: BOOL match = [object isEqualToString:@"..."];
  return match;
}];
```

**Dictionaries:**
```objc
NSDictionary *collection = @{ @"Canada" : @"Victoria", @"Greece": @"Athens", @"Russia": @"Moscow" };
NSDictionary *filtered = [collection KS_reject:^BOOL (NSString *key, NSString *value) {
  // ex.: BOOL match = [key isEqualToString:@"..."] || [value isEqualToString:@"..."];
  return match;
}];
```

### Inflections

#### Pluralize

```objc
[@"cookie" KS_pluralize]; // cookies
[@"cherry" KS_pluralize]; // cherries
[@"potato" KS_pluralize]; // potatoes
```

#### Singularize

```objc
[@"cookies" KS_singularize]; // cookie
[@"cherries" KS_pluralize]; // cherry
[@"potatoes" KS_pluralize]; // potato
```

#### Advanced

```objc
[KSInflector config:^(KSInflector *inflector) {
  [inflector singular:@"oxen$" replacement:@"ox"];
  [inflector plural:@"ox$" replacement:@"oxen"];
}];
```

## Author

Kevin Sylvestre, kevin@ksylvest.com

## License

KSReason is available under the MIT license. See the LICENSE file for more info.
