//
//  NSNumber+KSParser.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-08.
//
//

#import "NSNumber+KSParser.h"
#import "NSObject+KSParser.h"

@implementation NSNumber (KSParser)

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Parsing

+ (NSNumber *)ks_parse:(id)object
{
    object = [super ks_parse:object];
    if (!object || [object isKindOfClass:[NSNumber class]]) return object;
    
    static NSNumberFormatter *customNumberFormatter = nil;
    
    if (!customNumberFormatter)
    {
        customNumberFormatter = [NSNumberFormatter new];
        [customNumberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    }
    
    return [customNumberFormatter numberFromString:object];
}

+ (NSInteger)ks_integer:(id)object
{
    return [[self ks_parse:object] integerValue];
}

+ (BOOL)ks_bool:(id)object
{
    return [[self ks_parse:object] boolValue];
}

+ (float)ks_float:(id)object
{
    return [[self ks_parse:object] floatValue];
}

+ (double)ks_double:(id)object
{
    return [[self ks_parse:object] doubleValue];
}

+ (long)ks_long:(id)object
{
    return [[self ks_parse:object] longValue];
}

@end
