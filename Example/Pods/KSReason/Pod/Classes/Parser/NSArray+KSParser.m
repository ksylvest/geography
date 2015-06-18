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

+ (NSArray *)KS_parse:(id)object
{
    object = [super KS_parse:object];
    if (!object || [object isKindOfClass:[NSArray class]]) return object;
    return NULL;
}

@end
