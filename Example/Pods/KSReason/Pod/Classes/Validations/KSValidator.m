//
//  KSValidator.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-19.
//
//

#import <KSReason/KSEnumerable.h>
#import <KSReason/KSExistentialism.h>

#import "KSValidator.h"

@implementation KSValidator

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Validations

+ (BOOL)length:(NSString *)string is:(NSUInteger)length
{
    return string.length == length;
}

+ (BOOL)length:(NSString *)string minimum:(NSUInteger)minimum
{
    return string.length >= minimum;
}

+ (BOOL)length:(NSString *)string maximum:(NSUInteger)maximum
{
    return string.length <= maximum;
}

+ (BOOL)format:(NSString *)string with:(id)regex
{
   return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex] evaluateWithObject:string];
}

+ (BOOL)inclusion:(NSObject *)object collection:(NSObject *)collection
{
    return [collection conformsToProtocol:@protocol(KSIterable)] &&
    [((NSObject <KSIterable> *)collection) KS_any:^BOOL(id object) { return [object isEqual:object]; }];
}

+ (BOOL)exclusion:(NSObject *)object collection:(NSObject *)collection
{
    return ![self inclusion:object collection:collection];
}

+ (BOOL)presence:(NSObject *)object
{
    return object.KS_exists;
}

+ (BOOL)absence:(NSObject *)object
{
    return ![self presence:object];
}

@end
