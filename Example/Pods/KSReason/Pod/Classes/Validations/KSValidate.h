//
//  KSValidate.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-19.
//
//

#import <Foundation/Foundation.h>

extern NSString * const KSValidateFormatEmail;
extern NSString * const KSValidateFormatPhone;
extern NSString * const KSValidateFormatURL;
extern NSString * const KSValidateFormatSSN;
extern NSString * const KSValidateFormatSIN;

@interface KSValidate : NSObject

// Kinds:

+ (NSString *)block;
+ (NSString *)length;
+ (NSString *)format;
+ (NSString *)inclusion;
+ (NSString *)exclusion;
+ (NSString *)presence;
+ (NSString *)absence;

// Attributes:

+ (NSString *)is;
+ (NSString *)minimum;
+ (NSString *)maximum;
+ (NSString *)with;
+ (NSString *)of;
+ (NSString *)message;

@end
