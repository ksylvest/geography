//
//  NSDictionary+KSParser.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-08.
//
//

#import "NSDictionary+KSParser.h"
#import "NSObject+KSParser.h"

@implementation NSDictionary (KSParser)

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Parsing

+ (NSArray *)KS_parse:(id)object
{
    object = [super KS_parse:object];
    if (!object || [object isKindOfClass:[NSDictionary class]]) return object;
    return NULL;
}

@end
