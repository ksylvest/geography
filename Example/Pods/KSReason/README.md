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


### Backbone

**Backbone** is a component designed to implement models and collections (inspired by the web framework with the same name).

#### Models

```objc
KSModel *model = [KSModel new];
[model parse:@{ @"id": @"...", @"title": @"...", @"description": @"..." }];
[model get:@"title"];
[model get:@"description"];
```

#### Collections

```objc
KSCollection *collection = [KSCollection new];
[collection parse:@[@{ @"id": @"...", @"title": @"...", @"description": @"..." }]];
collection.models;
```

### Enumerable

#### Iterating

**Sets:**
```objc
NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
[collection ks_each:^(NSString *object) {
  // ...
}];
```

**Arrays:**
```objc
NSArray *collection = [NSArray arrayWithObjects;@"Canada", @"Greece", @"Russia", NULL];
[collection ks_each:^(NSString *object) {
  // ...
}];
```

**Dictionaries:**
```objc
NSDictionary *collection = @{ @"Canada": @"Victoria", @"Russia": @"Moscow", @"Greece": @"Athens" };
[collection ks_each:^(NSString *key, NSString *value) {
  // ...
}];
```

#### Map

**Sets:**
```objc
NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
NSSet *mapping = [collection ks_map:^NSString *(NSString *object) {
  // ex: NSString *mapping = [object reverse];
  return mapping;
}];
```

**Arrays:**
```objc
NSArray *collection = [NSArray arrayWithObjects;@"Canada", @"Greece", @"Russia", NULL];
NSArray *mapping = [collection ks_map:^NSString *(NSString *object) {
  // ex: NSString *mapping = [object reverse];
  return mapping;
}];
```

**Dictionaries:**
```objc
NSDictionary *collection = @{ @"Canada": @"Victoria", @"Russia": @"Moscow", @"Greece": @"Athens" };
NSDictionary *mapping = [collection ks_map:^NSString *(NSString *key, NSString *value) {
  // ex: NSString *mapping = [value reverse];
  return mapping;
}];
```

#### Reduce

**Sets:**
```objc
NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
NSString *reduction = [collection ks_reduce:^NSString *(NSString *memo, NSString *object){
  return [NSString stringWithFormat:@"%@ %@", memo, object];
} memo:@"reduction:"];
```

**Arrays:**
```objc
NSArray *collection = [NSArray arrayWithObjects;@"Canada", @"Greece", @"Russia", NULL];
NSString *reduction = [collection ks_reduce:^NSString *(NSString *memo, NSString *object){
  return [NSString stringWithFormat:@"%@ %@", memo, object];
} memo:@"reduction:"];
```

**Dictionaries:**
```objc
NSArray *collection = [NSArray arrayWithObjects;@"Canada", @"Greece", @"Russia", NULL];
NSString *reduction = [collection ks_reduce:^NSString *(NSString *memo, NSString *key, NSString *value){
  return [NSString stringWithFormat:@"%@ %@", memo, value];
} memo:@"reduction:"];
```

#### Find

**Sets:**
```objc
NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
NSString *element = [collection ks_find:^BOOL (NSString *object) {
  return [object isEqualToString:@"..."];
}];
```

**Arrays:**
```objc
NSArray *collection = [NSArray arrayWithObjects:@"Canada", @"Greece", @"Russia", NULL];
NSString *element = [collection ks_find:^BOOL (NSString *object) {
  return [object isEqualToString:@"..."];
}];
```

**Dictionaries:**
```objc
NSDictionary *collection = @{ @"Canada" : @"Victoria", @"Greece": @"Athens", @"Russia": @"Moscow" };
NSString *element = [collection ks_find:^BOOL (NSString *key, NSString *value) {
  return [key isEqualToString:@"..."];
}];
```

#### Any

**Sets:**
```objc
NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
BOOL any = [collection ks_any:^BOOL (NSString *object) {
  return [object isEqualToString:@"..."];
}];
```

**Arrays:**
```objc
NSArray *collection = [NSArray arrayWithObjects:@"Canada", @"Greece", @"Russia", NULL];
BOOL any = [collection ks_any:^BOOL (NSString *object) {
  return [object isEqualToString:@"..."];
}];
```

**Dictionaries:**
```objc
NSDictionary *collection = @{ @"Canada" : @"Victoria", @"Greece": @"Athens", @"Russia": @"Moscow" };
BOOL any = [collection ks_any:^BOOL (NSString *key, NSString *value) {
  return [key isEqualToString:@"..."];
}];
```

#### All

**Sets:**
```objc
NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
BOOL all = [collection ks_all:^BOOL (NSString *object) {
  return [object isEqualToString:@"..."];
}];
```

**Arrays:**
```objc
NSArray *collection = [NSArray arrayWithObjects:@"Canada", @"Greece", @"Russia", NULL];
BOOL all = [collection ks_all:^BOOL (NSString *object) {
  return [object isEqualToString:@"..."];
}];
```

**Dictionaries:**
```objc
NSDictionary *collection = @{ @"Canada" : @"Victoria", @"Greece": @"Athens", @"Russia": @"Moscow" };
BOOL all = [collection ks_all:^BOOL (NSString *key, NSString *value) {
  return [key isEqualToString:@"..."];
}];
```

#### Filter

**Sets:**
```objc
NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
NSSet *filter = [collection ks_filter:^BOOL (NSString *object) {
  // ex.: BOOL match = [object isEqualToString:@"..."];
  return match;
}];
```

**Arrays:**
```objc
NSArray *collection = [NSArray arrayWithObjects:@"Canada", @"Greece", @"Russia", NULL];
NSArray *filtered = [collection ks_filter:^BOOL (NSString *object) {
  // ex.: BOOL match = [object isEqualToString:@"..."];
  return match;
}];
```

**Dictionaries:**
```objc
NSDictionary *collection = @{ @"Canada" : @"Victoria", @"Greece": @"Athens", @"Russia": @"Moscow" };
NSDictionary *filtered = [collection ks_filter:^BOOL (NSString *key, NSString *value) {
  // ex.: BOOL match = [key isEqualToString:@"..."] || [value isEqualToString:@"..."];
  return match;
}];
```

#### Reject

**Sets:**
```objc
NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
NSSet *filter = [collection ks_reject:^BOOL (NSString *object) {
  // ex.: BOOL match = [object isEqualToString:@"..."];
  return match;
}];
```

**Arrays:**
```objc
NSArray *collection = [NSArray arrayWithObjects:@"Canada", @"Greece", @"Russia", NULL];
NSArray *filtered = [collection ks_reject:^BOOL (NSString *object) {
  // ex.: BOOL match = [object isEqualToString:@"..."];
  return match;
}];
```

**Dictionaries:**
```objc
NSDictionary *collection = @{ @"Canada" : @"Victoria", @"Greece": @"Athens", @"Russia": @"Moscow" };
NSDictionary *filtered = [collection ks_reject:^BOOL (NSString *key, NSString *value) {
  // ex.: BOOL match = [key isEqualToString:@"..."] || [value isEqualToString:@"..."];
  return match;
}];
```

#### Minimum

**Sets:**
```objc
NSSet *collection = [NSSet setWithObjects:@1.0, @1.25, @0.75, NULL];
collection.ks_minimum; //0.75
```

**Arrays:**
```objc
NSArray *collection = [NSArray arrayWithObjects:@1.00, @1.25, @0.75, NULL];
collection.ks_minimum; // 0.75;
```

**Dictionaries:**
```objc
NSDictionary *collection = @{ @"USD": @1.00, @"CDN": @1.25, @"EUR": @0.75 };
collection.ks_minimum; // 0.75
```

#### Maximum

**Sets:**
```objc
it (@"exposes the maximum in an set", ^{
NSSet *collection = [NSSet setWithObjects:@1.00, @1.25, @0.75, NULL];
collection.ks_maximum; // 1.25
```

**Arrays:**
```objc
it (@"exposes the maximum in an array", ^{
NSArray *collection = [NSArray arrayWithObjects:@1.0, @1.25, @0.75, NULL];
collection.ks_maximum; //1.25);
```

**Dictionaries:**
```objc
NSDictionary *collection = @{ @"USD": @1.0, @"CDN": @1.25, @"EUR": @0.75 };
collection.ks_maximum; //1.25
```

#### Sample

**Sets:**
```objc
NSSet *collection = [NSSet setWithObjects:@1.0, @1.25, @0.75, NULL];
collection.ks_sample; // (1.0 | 1.25 | 0.75)
```

**Arrays:**
```objc
NSArray *collection = [NSArray arrayWithObjects:@1.0, @1.25, @0.75, NULL];
collection.ks_sample; // (1.0 | 1.25 | 0.75)
```

**Dictionaries:**
```objc
NSDictionary *collection = @{ @"USD": @1.0, @"CDN": @1.25, @"EUR": @0.75 };
collection.ks_sample; // (1.0 | 1.25 | 0.75)
```

### Validations

#### Validate

```objc
NSDictionary *attributes = @{ @"name": @"John Smith", @"email": @"john.smith@mail.org", @"phone": @"+1 555-555-5555" };
NSDictionary *validations = @{ 
  @"name": @{ KSValidate.presence: @{ KSValidate.message: @"must be entered" } },
  @"tagline": @{ KSValidate.length: @{ KSValidate.minimum: @20, KSValidate.maximum: @80 } },
  @"email": @{ KSValidate.format: @{ KSValidate.with: KSValidateFormatEmail } },
  @"phone": @{ KSValidate.format: @{ KSValidate.with: KSValidateFormatPhone } },
  @"country": @{ KSValidate.inclusion: @{ KSValidate.of: @[@"Canada"] } },
  @"region": @{ KSValidate.exclusion: @{ KSValidate.of: @[@"PEI"] } },
};

KSValidator *validator = [KSValidator validator:validations];
[validator validate:attributes];

validator.errors; 
// ex.: 
// @{ 
//   @"tagline": @[@"must be between 20 and 80 characters", @"cannot contain inappriate language"], 
//   @"email": @[@"is formatted wrong"], @"phone": @[@"is formatted wrong"]
// };

validator.humanize;
// @"tagline must be between 20 and 80 characters, tagline cannot contain inapproriate language, email is formatted wrong, phone is formatted wrong and name can't be blank"
```

#### Length

```objc
[KSValidator length:@"test" is:8]; // NO
[KSValidator length:@"test" is:4]; // YES

[KSValidator length:@"test" minimum:5]; // NO
[KSValidator length:@"test" minimum:4]; // YES
[KSValidator length:@"test" minimum:3]; // YES

[KSValidator length:@"test" maximum:3]; // NO
[KSValidator length:@"test" maximum:4]; // YES
[KSValidator length:@"test" maximum:5]; // YES
```

#### Format

```objc
[KSValidator format:@"tester" with:KSValidationEmail]; // NO
[KSValidator format:@"tester@mail.org" with:KSValidationEmail]; // YES

[KSValidator format:@"tester" with:KSValidationPhone]; // NO
[KSValidator format:@"+1 555-555-5555" with:KSValidationPhone]; // YES

[KSValidator format:@"..." with:@"\\A[a-z]+\\z"]; // NO
[KSValidator format:@"abcdefghijklmnopqrstuvwxyz" with:@"\\A[a-z]+\\z"]; // YES
```

#### Inclusion

```objc
[KSValidator inclusion:@"blue" collection:@[@"blue"]]; // YES
[KSValidator inclusion:@"pink" collection:@[@"blue"]]; // NO
```

#### Exclusion

```objc
[KSValidator exclusion:@"blue" collection:@[@"blue"]]; // YES
[KSValidator exclusion:@"pink" collection:@[@"blue"]]; // NO
```

#### Presence

```objc
[KSValidator presence:@"Greetings!"]; // YES
```

#### Absence

```objc
[KSValidator absence:@"Greetings!"]; // NO
```

The attribute names may also be addint the following to `Localizable.strings`:

#### Localizations

**Messages:**
```strings
"is invalid": "...";
"can't be blank": "...";
"can't be present": "...";
"must be exactly %@ characters": "...";
"must be between %@ and %@ characters": "...";
"must be a minimum of %@ characters": "...";
"must be a maximum of %@ characters": "...";
```

**Attributes:**

```strings
"ssn" = "social security number";
```

### Inflections

#### Pluralize

```objc
[@"cookie" ks_pluralize]; // cookies
[@"cherry" ks_pluralize]; // cherries
[@"potato" ks_pluralize]; // potatoes
```

#### Singularize

```objc
[@"cookies" ks_singularize]; // cookie
[@"cherries" ks_pluralize]; // cherry
[@"potatoes" ks_pluralize]; // potato
```

#### Advanced

```objc
[KSInflector config:^(KSInflector *inflector) {
  [inflector singular:@"oxen$" replacement:@"ox"];
  [inflector plural:@"ox$" replacement:@"oxen"];
}];
```

### Existentialism

#### Objects

```objc
[NSNull null].ks_exists; // NO
[NSObject new].ks_exists; // YES
```

#### Sets

```objc
[NSSet set].ks_exists; // NO
[NSSet setWithObject:object].ks_exists; // YES
```

#### Arrays
```objc
[NSArray set].ks_exists; // NO
[NSArray setWithObject:object].ks_exists; // YES
```

#### Dictionaries
```objc
@{}.ks_exists; // NO
@{ key: value }.ks_exists; // YES
```

#### Strings

```objc
@"".ks_exists; // NO
@"Greetings!".ks_exists; // YES
```

## Author

Kevin Sylvestre, kevin@ksylvest.com

## License

KSReason is available under the MIT license. See the LICENSE file for more info.
