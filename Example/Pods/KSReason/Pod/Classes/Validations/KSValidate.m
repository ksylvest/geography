//
//  KSValidate.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-19.
//
//

#import "KSValidate.h"

NSString * const KSValidateFormatEmail = @"\\A([^\\s]+)@([^\\s]+).([^\\s]+)\\Z";
NSString * const KSValidateFormatPhone = @"\\A[0-9\\s\\(\\)\\+\\-]+\\Z";
NSString * const KSValidateFormatURL = @"\\Ahttps?:\\\\\\s+\\Z";
NSString * const KSValidateFormatSSN = @"\\A\\d{3}[\\s\\-]?\\d{2}[\\s\\-]?\\d{4}\\Z";
NSString * const KSValidateFormatSIN = @"\\A\\d{3}[\\s\\-]?\\d{3}[\\s\\-]?\\d{3}\\Z";

@implementation KSValidate

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Kinds

+ (NSString *)block
{
    static NSString *length = @"block";
    return length;
}

+ (NSString *)length
{
    static NSString *length = @"length";
    return length;
}

+ (NSString *)format
{
    static NSString *format = @"format";
    return format;
}

+ (NSString *)inclusion
{
    static NSString *inclusion = @"inclusion";
    return inclusion;
}

+ (NSString *)exclusion
{
    static NSString *exclusion = @"exclusion";
    return exclusion;
}

+ (NSString *)presence
{
    static NSString *presence = @"presence";
    return presence;
}

+ (NSString *)absence
{
    static NSString *absence = @"absence";
    return absence;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Attributes

+ (NSString *)is
{
    static NSString *is = @"is";
    return is;
}

+ (NSString *)minimum
{
    static NSString *minimum = @"minimum";
    return minimum;
}

+ (NSString *)maximum
{
    static NSString *maximum = @"maximum";
    return maximum;
}

+ (NSString *)with
{
    static NSString *with = @"with";
    return with;
}

+ (NSString *)of
{
    static NSString *of = @"of";
    return of;
}

+ (NSString *)message
{
    static NSString *message = @"message";
    return message;
}

@end
