//
//  NSURL+KSParser.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-08.
//
//

#import "NSURL+KSParser.h"
#import "NSObject+KSParser.h"

@implementation NSURL (KSParser)

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Parsing

+ (NSURL *)ks_parse:(id)object
{
    object = [super ks_parse:object];
    if (!object || [object isKindOfClass:[NSURL class]]) return object;
    
    return [NSURL URLWithString:object];
}

@end
