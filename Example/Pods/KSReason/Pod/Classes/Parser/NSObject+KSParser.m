//
//  NSObject+KSParser.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-08.
//
//

#import "NSObject+KSParser.h"

@implementation NSObject (KSParser)

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Parsing

+ (NSDate *)ks_parse:(id)object;
{
    if ([object isKindOfClass:[NSNull class]]) return NULL;
    else return object;
}

@end
