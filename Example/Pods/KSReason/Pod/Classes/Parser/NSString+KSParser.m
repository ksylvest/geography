//
//  NSString+KSParser.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-08.
//
//

#import "NSString+KSParser.h"
#import "NSObject+KSParser.h"

@implementation NSString (KSParser)

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Parsing

+ (NSString *)KS_parse:(id)object
{
    object = [super KS_parse:object];
    if (!object || [object isKindOfClass:[NSString class]]) return object;
    return [NSString stringWithFormat:@"%@", object];

}

@end
