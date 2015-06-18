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

+ (NSNumber *)KS_parse:(id)object
{
    object = [super KS_parse:object];
    if (!object || [object isKindOfClass:[NSNumber class]]) return object;
    
    static NSNumberFormatter *customNumberFormatter = nil;
    
    if (!customNumberFormatter)
    {
        customNumberFormatter = [NSNumberFormatter new];
        [customNumberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    }
    
    return [customNumberFormatter numberFromString:object];
}

+ (NSInteger)KS_integer:(id)object
{
    return [[self KS_parse:object] integerValue];
}

+ (BOOL)KS_bool:(id)object
{
    return [[self KS_parse:object] boolValue];
}

+ (float)KS_float:(id)object
{
    return [[self KS_parse:object] floatValue];
}

+ (double)KS_double:(id)object
{
    return [[self KS_parse:object] doubleValue];
}

+ (long)KS_long:(id)object
{
    return [[self KS_parse:object] longValue];
}

@end
