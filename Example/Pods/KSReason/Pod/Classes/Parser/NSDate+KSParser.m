//
//  NSDate+KSParser.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-08.
//
//

#import "NSDate+KSParser.h"
#import "NSObject+KSParser.h"

@implementation NSDate (KSParser)

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Parsing

+ (NSDate *)ks_parse:(id)object
{
    object = [super ks_parse:object];
    if (!object || [object isKindOfClass:[NSDate class]]) return object;
    
    static NSDateFormatter *customDateFormatter = nil;
    
    if (!customDateFormatter)
    {
        customDateFormatter = [NSDateFormatter new];
        [customDateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
    }
    
    return [customDateFormatter dateFromString:object];
}

@end
