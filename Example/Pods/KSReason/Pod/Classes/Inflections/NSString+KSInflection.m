//
//  NSArray+KSInflection.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-07-12.
//
//

#import "NSString+KSInflection.h"

#import "KSInflector.h"

@implementation NSString (KSInflection)

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Inflections

- (NSString *)KS_pluralize
{
    return [KSInflector.shared pluralize:self];
}

- (NSString *)KS_singularize
{
    return [KSInflector.shared singularize:self];
}

@end
