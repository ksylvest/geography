//
//  NSArray+KSParser.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-08.
//
//

#import "NSArray+KSParser.h"
#import "NSObject+KSParser.h"

@implementation NSArray (KSParser)

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Parsing

+ (NSArray *)ks_parse:(id)object
{
    object = [super ks_parse:object];
    if (!object || [object isKindOfClass:[NSArray class]]) return object;
    return NULL;
}

@end
